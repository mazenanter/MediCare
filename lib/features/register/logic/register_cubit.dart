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
  void emitRegisterUserState() async {
    emit(RegisterState.registerLoading());
    final result = await registerRepo.createAccount(
        registerRequestBody: RegisterRequestBody(
      email: emailController.text,
      password: passwordController.text,
      name: usernameController.text,
    ));
    result.when(
      success: (registerResponse) => emit(RegisterState.registerSuccess()),
      error: (errorMsg) => emit(RegisterState.registerError(errorMsg)),
    );
  }
}
