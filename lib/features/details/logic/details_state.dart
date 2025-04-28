import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_state.freezed.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = _Initial;
  const factory DetailsState.deleteLoading() = DeleteLoading;
  const factory DetailsState.deleteSuccess() = DeleteSuccess;
  const factory DetailsState.deleteError(String message) = DeleteError;
}
