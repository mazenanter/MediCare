import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/features/login/data/models/login_request_body.dart';
import 'package:medicare/features/login/data/repo/login_repo.dart';
import 'package:medicare/features/login/logic/login_state.dart';

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
    result.when(success: (data) {
      emit(LoginState.loginSuccess());
    }, error: (message) {
      emit(LoginState.loginError(message));
    });
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    emit(LoginState.loginLoading());
    final result = await loginRepo.signInWithGoogle(context);
    result.when(success: (data) {
      emit(LoginState.loginSuccess());
    }, error: (message) {
      emit(LoginState.loginError(message));
    });
  }
}
