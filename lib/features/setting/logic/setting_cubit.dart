import 'package:bloc/bloc.dart';
import 'package:medicare/core/helpers/constants.dart';
import 'package:medicare/core/helpers/shared_pref_helper.dart';
import 'package:medicare/features/setting/logic/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  Future<void> logoutUser() async {
    try {
      await SharedPrefHelper.removeSecuredData(AppConstants.userId);
      emit(SettingState.signOut());
    } catch (e) {
      emit(SettingState.signOutError(e.toString()));
    }
  }
}
