import 'package:flutter/material.dart';
import 'package:medicare/core/networking/firebase_error_handler.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/features/login/data/models/login_request_body.dart';

import '../../../../core/networking/firebase_auth_service.dart';

class LoginRepo {
  final FirebaseAuthService firebaseAuthService;

  LoginRepo(this.firebaseAuthService);

  Future<FirebaseResult<void>> login(
      {required LoginRequestBody loginRequestBody,
      required BuildContext context}) async {
    try {
      await firebaseAuthService.login(
          email: loginRequestBody.email, password: loginRequestBody.password);
      return const FirebaseResult.success(null);
    } catch (e) {
      return FirebaseResult.error(
          FirebaseErrorHandler.getErrorMessage(e, context));
    }
  }
}
