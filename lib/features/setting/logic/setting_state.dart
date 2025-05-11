import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState.initial() = _Initial;
  const factory SettingState.profileLoading() = ProfileLoading;
  const factory SettingState.profileSuccess() = ProfileSuccess;
  const factory SettingState.profileError(String message) = ProfileError;
  const factory SettingState.signOut() = SignOut;
  const factory SettingState.signOutError(String message) = SignOutError;
}
