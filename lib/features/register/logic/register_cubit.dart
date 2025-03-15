import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medicare/features/register/data/models/register_request_body.dart';
import 'package:medicare/features/register/data/repo/register_repo.dart';
import 'package:medicare/features/register/logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterState.initial());

  final RegisterRepo registerRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void emitRegisterUserState(BuildContext context) async {
    emit(RegisterState.registerLoading());
    final result = await registerRepo.createAccount(
        context: context,
        registerRequestBody: RegisterRequestBody(
          email: emailController.text,
          password: passwordController.text,
          name: usernameController.text,
        ));
    result.when(
      success: (registerResponse) =>
          emit(RegisterState.registerSuccess(isGoogleSignin: false)),
      error: (errorMsg) => emit(RegisterState.registerError(errorMsg)),
    );
  }

  void emitGoogleUserState(BuildContext context) async {
    emit(RegisterState.registerLoading());
    final result = await registerRepo.signInWithGoogle(context);
    result.when(
      success: (registerResponse) =>
          emit(RegisterState.registerSuccess(isGoogleSignin: true)),
      error: (errorMsg) => emit(RegisterState.registerError(errorMsg)),
    );
  }
}
