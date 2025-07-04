import 'package:bloc/bloc.dart';
import 'package:medicare/core/helpers/constants.dart';
import 'package:medicare/core/helpers/shared_pref_helper.dart';
import 'package:medicare/features/setting/data/models/user_model.dart';
import 'package:medicare/features/setting/data/repo/setting_repo.dart';
import 'package:medicare/features/setting/logic/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.settingRepo) : super(SettingState.initial());

  final SettingRepo settingRepo;
  Future<void> logoutUser() async {
    try {
      await SharedPrefHelper.removeSecuredData(AppConstants.userId);
      emit(SettingState.signOut());
    } catch (e) {
      emit(SettingState.signOutError(e.toString()));
    }
  }

  getUserId() async {
    final userId = await SharedPrefHelper.getSecuredData(AppConstants.userId);
    return userId;
  }

  UserModel? userModel;
  Future<void> getUserData() async {
    emit(SettingState.profileLoading());
    final userData = await settingRepo.getUserData(await getUserId());
    userData.when(
      error: (message) => emit(SettingState.profileError(message)),
      success: (user) async {
        userModel = user;
        emit(SettingState.profileSuccess(user));
      },
    );
  }
}
