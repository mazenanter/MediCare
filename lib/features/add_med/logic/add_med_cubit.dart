import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicare/features/add_med/data/model/add_med_request_model.dart';
import 'package:medicare/features/add_med/data/repo/add_med_repo.dart';
import 'package:medicare/features/add_med/logic/add_med_state.dart';

enum MedicationStatus { taken, notTaken }

class AddMedCubit extends Cubit<AddMedState> {
  final AddMedRepo addMedRepo;

  // Controllers for form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController doseController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  // Form key for validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Dropdown selection
  String? selectedType;
  // Medication status
  MedicationStatus isTaken = MedicationStatus.notTaken;
  // Date and time for reminder
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  AddMedCubit(this.addMedRepo) : super(AddMedState.initial());
  Future<void> addMedication(BuildContext context) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    emit(AddMedState.loading());
    final result = await addMedRepo.addMedication(
      AddMedRequestModel(
        name: nameController.text,
        type: selectedType ?? 'Unknown',
        amount: int.tryParse(amountController.text) ?? 0,
        dose: doseController.text,
        isTaken: isTaken == MedicationStatus.taken ? 1 : 0,
        dateTime: _getSelectedTimestamp(),
        createdAt: Timestamp.now(),
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
    return super.close();
  }
}
