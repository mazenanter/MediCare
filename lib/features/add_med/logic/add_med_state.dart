import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_med_state.freezed.dart';

@freezed
class AddMedState with _$AddMedState {
  const factory AddMedState.initial() = _Initial;
  const factory AddMedState.loading() = Loading;
  const factory AddMedState.success(String message) = Success;
  const factory AddMedState.error(String message) = Error;
  const factory AddMedState.update() = Update;
  const factory AddMedState.change() = Change;
}
