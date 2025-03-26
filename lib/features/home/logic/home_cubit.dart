import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/helpers/shared_pref_helper.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';
import 'package:medicare/features/home/data/repo/home_repo.dart';
import 'package:medicare/features/home/logic/home_state.dart';

import '../../../core/helpers/constants.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeState.initial());
  final HomeRepo homeRepo;
  List<MedicationResponseModel> medicationsList = [];
  void getMedications(BuildContext context) async {
    emit(HomeState.homeLoading());
    String? userId = await SharedPrefHelper.getSecuredData(AppConstants.userId);
    if (userId == null || userId.isEmpty) {
      emit(HomeError("User ID is missing"));
      return;
    }
    final result = await homeRepo.getMedications(userId, context);
    result.when(
      success: (medications) {
        medicationsList = medications;
        emit(HomeState.homeSuccess(medications));
      },
      error: (message) {
        emit(HomeState.homeError(message));
      },
    );
  }
}
