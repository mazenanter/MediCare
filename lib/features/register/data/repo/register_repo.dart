import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare/core/networking/firebase_auth_service.dart';
import 'package:medicare/core/networking/firebase_error_handler.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/core/networking/firestore_service.dart';
import 'package:medicare/features/register/data/models/register_response.dart';

import '../models/register_request_body.dart';

class RegisterRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirestoreService firestoreService;

  RegisterRepo(this.firebaseAuthService, this.firestoreService);

  Future<FirebaseResult<RegisterResponse>> createAccount(
      {required RegisterRequestBody registerRequestBody}) async {
    try {
      User? user = await firebaseAuthService.createAccount(
          email: registerRequestBody.email,
          password: registerRequestBody.password);
      if (user == null) return FirebaseResult.error('Something went wrong');
      await user.updateDisplayName(registerRequestBody.name);
      RegisterResponse registerResponse = RegisterResponse(
        email: user.email ?? '',
        name: user.displayName ?? registerRequestBody.name,
        uId: user.uid,
      );
      await firestoreService.addUser(registerResponse);
      return FirebaseResult.success(registerResponse);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.getErrorMessage(e));
    }
  }
}
