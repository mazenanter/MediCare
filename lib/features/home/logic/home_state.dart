import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.homeLoading() = HomeLoading;
  const factory HomeState.homeSuccess(
      List<MedicationResponseModel> medications) = HomeSuccess;
  const factory HomeState.homeError(String message) = HomeError;
}
