import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/core/helpers/shared_pref_helper.dart';
import 'package:medicare/features/login/data/models/login_request_body.dart';
import 'package:medicare/features/login/data/repo/login_repo.dart';
import 'package:medicare/features/login/logic/login_state.dart';

import '../../../core/helpers/constants.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginState.initial());

  final LoginRepo loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> login({required BuildContext context}) async {
    emit(LoginState.loginLoading());
    final result = await loginRepo.login(
      context: context,
      loginRequestBody: LoginRequestBody(
          email: emailController.text, password: passwordController.text),
    );
    result.when(success: (userData) {
      emit(LoginState.loginSuccess());
      SharedPrefHelper.secureData(
        AppConstants.userId,
        userData.uId,
      );
    }, error: (message) {
      emit(LoginState.loginError(message));
    });
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    emit(LoginState.loginLoading());
    final result = await loginRepo.signInWithGoogle(context);
    result.when(success: (userData) {
      emit(LoginState.loginSuccess());
      SharedPrefHelper.secureData(
        AppConstants.userId,
        userData.uId,
      );
    }, error: (message) {
      emit(LoginState.loginError(message));
    });
  }
}
