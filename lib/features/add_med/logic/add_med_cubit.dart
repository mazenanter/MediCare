import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicare/features/add_med/data/model/add_med_request_model.dart';
import 'package:medicare/features/add_med/data/repo/add_med_repo.dart';
import 'package:medicare/features/add_med/logic/add_med_state.dart';
import 'package:medicare/features/details/data/repo/details_repo.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';

enum MedicationStatus { taken, notTaken }

class AddMedCubit extends Cubit<AddMedState> {
  final AddMedRepo addMedRepo;
  final DetailsRepo detailsRepo;
  // Controllers for form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController doseController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController repeatTypeController = TextEditingController();
  // Form key for validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Dropdown selection
  String? selectedType;
  String? selectedRepeatType;
  // Medication status
  MedicationStatus isTaken = MedicationStatus.notTaken;
  // Date and time for reminder
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  String? medicationId;
  AddMedCubit(this.addMedRepo, this.detailsRepo) : super(AddMedState.initial());
  MedicationResponseModel? medicationResponseModel;
  init(MedicationResponseModel model) {
    medicationResponseModel = model;
    medicationId = model.id;
    nameController.text = model.name;
    doseController.text = model.dose;
    amountController.text = model.amount.toString();
    daysController.text = model.durationDays.toString();
    hoursController.text = model.intervalHours?.toString() ?? '';
    repeatTypeController.text = model.repeatType;
    selectedType = model.type;
    selectedRepeatType = model.repeatType;
    isTaken =
        model.isTaken == 1 ? MedicationStatus.taken : MedicationStatus.notTaken;
    selectedDate = model.dateTime.toDate();
    selectedTime = TimeOfDay.fromDateTime(model.dateTime.toDate());
  }

  Future<void> addMedication(BuildContext context) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    emit(AddMedState.loading());
    if (medicationId != null) {
      final result = await detailsRepo.updateMedication(
        medicationId: medicationId!,
        model: AddMedRequestModel(
          id: medicationId!,
          name: nameController.text,
          type: selectedType ?? 'Unknown',
          amount: int.tryParse(amountController.text) ?? 0,
          dose: doseController.text,
          createdAt: medicationResponseModel?.createdAt ?? Timestamp.now(),
          isTaken: isTaken == MedicationStatus.taken ? 1 : 0,
          dateTime: _getSelectedTimestamp(),
          repeatType: selectedRepeatType ?? 'One time',
          intervalHours: selectedRepeatType == 'Every X hours'
              ? int.tryParse(hoursController.text)
              : null,
          durationDays: int.tryParse(daysController.text) ?? 0,
        ),
      );
      result.when(
        success: (message) {
          emit(AddMedState.success(message));
        },
        error: (message) {
          emit(AddMedState.error(message));
        },
      );
    } else {
      final result = await addMedRepo.addMedication(
        AddMedRequestModel(
          id: addMedRepo.firestoreService.firestore
              .collection('users')
              .doc()
              .collection('medications')
              .doc()
              .id,
          name: nameController.text,
          type: selectedType ?? 'Unknown',
          amount: int.tryParse(amountController.text) ?? 0,
          dose: doseController.text,
          isTaken: isTaken == MedicationStatus.taken ? 1 : 0,
          dateTime: _getSelectedTimestamp(),
          createdAt: Timestamp.now(),
          repeatType: selectedRepeatType ?? 'One time',
          intervalHours: selectedRepeatType == 'Every X hours'
              ? int.tryParse(hoursController.text)
              : null,
          durationDays: int.tryParse(daysController.text) ?? 0,
        ),
        context,
      );
      result.when(
        success: (message) {
          emit(AddMedState.success(message));
        },
        error: (message) {
          emit(AddMedState.error(message));
        },
      );
    }
  }

  void updateSelectedTime(TimeOfDay newTime) {
    selectedTime = newTime;
    emit(AddMedState.change());
    emit(AddMedState.update());
  }

  void updateSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    emit(AddMedState.change());
    emit(AddMedState.update());
  }

  Timestamp _getSelectedTimestamp() {
    final DateTime combinedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    return Timestamp.fromDate(combinedDateTime);
  }

  @override
  Future<void> close() {
    nameController.dispose();
    doseController.dispose();
    amountController.dispose();
    daysController.dispose();
    hoursController.dispose();
    repeatTypeController.dispose();
    return super.close();
  }
}
