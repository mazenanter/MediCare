import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medicare/features/details/data/repo/details_repo.dart';
import 'package:medicare/features/details/logic/details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsState.initial());
  final DetailsRepo detailsRepo;
  Future<void> deleteMedication(String medicationId) async {
    emit(DetailsState.deleteLoading());
    final result =
        await detailsRepo.deleteMedication(medicationId: medicationId);
    result.when(
      success: (data) {
        emit(DetailsState.deleteSuccess());
      },
      error: (message) {
        emit(DetailsState.deleteError(message));
      },
    );
  }

  Future<void> updateTakeMedication(
      {required String medicationId,
      required int isTaken,
      required BuildContext context}) async {
    emit(DetailsState.updateLoading());
    final result = await detailsRepo.takeMedication(
        medicationId: medicationId, isTaken: isTaken, context: context);
    result.when(
      success: (message) {
        emit(DetailsState.updateSuccess(message));
      },
      error: (message) {
        emit(DetailsState.updateError(message));
      },
    );
  }
}
