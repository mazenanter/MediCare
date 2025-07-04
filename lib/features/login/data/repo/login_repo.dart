import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/networking/firebase_error_handler.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/features/login/data/models/login_request_body.dart';
import 'package:medicare/features/login/data/models/login_response.dart';

import '../../../../core/networking/firebase_auth_service.dart';
import '../../../../core/networking/firestore_service.dart';
import '../../../register/data/models/register_response.dart';

class LoginRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirestoreService firestoreService;
  LoginRepo(this.firebaseAuthService, this.firestoreService);

  Future<FirebaseResult<LoginResponse>> login(
      {required LoginRequestBody loginRequestBody,
      required BuildContext context}) async {
    try {
      final user = await firebaseAuthService.login(
          email: loginRequestBody.email, password: loginRequestBody.password);

      final loginResponse = LoginResponse(
        email: user?.email ?? '',
        name: user?.displayName ?? '',
        uId: user!.uid,
      );
      return FirebaseResult.success(loginResponse);
    } catch (e) {
      return FirebaseResult.error(
          FirebaseErrorHandler.getErrorMessage(e, context));
    }
  }

  Future<FirebaseResult<RegisterResponse>> signInWithGoogle(
      BuildContext context) async {
    try {
      UserCredential? userCredential =
          await firebaseAuthService.signInWithGoogle();
      if (userCredential == null) {
        return const FirebaseResult.error("Something went wrong");
      }
      RegisterResponse registerResponse = RegisterResponse(
        email: userCredential.user?.email ?? '',
        name: userCredential.user?.displayName ?? '',
        uId: userCredential.user?.uid ?? '',
      );

      await firestoreService.addUser(registerResponse);
      return FirebaseResult.success(registerResponse);
    } catch (e) {
      return FirebaseResult.error(
          // ignore: use_build_context_synchronously
          FirebaseErrorHandler.getErrorMessage(e, context));
    }
  }
}
