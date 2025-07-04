import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class FirebaseErrorHandler {
  static String getErrorMessage(dynamic error, BuildContext context) {
    debugPrint("🔥 ERROR TYPE: ${error.runtimeType}");
    debugPrint(
        "🔥 ERROR CODE: ${error is FirebaseAuthException ? error.code : 'UNKNOWN'}");
    if (error is FirebaseAuthException) {
      return _handleAuthError(error, context);
    } else if (error is FirebaseException) {
      return _handleFirebaseException(error, context);
    } else {
      return S.of(context).SomethingWentWrongPleaseTtryAgain;
    }
  }

  static String _handleAuthError(
      FirebaseAuthException e, BuildContext context) {
    debugPrint("🔥 AUTH ERROR CODE: ${e.code}");
    switch (e.code) {
      case "email-already-in-use":
        return S.of(context).EmailAlreadyInUsePleaseUseADifferentEmail;
      case "weak-password":
        return S.of(context).PasswordTooWeak;
      case "invalid-email":
        return S.of(context).InvalidEmailAddressPleaseCheckAndTryAgain;
      case "user-not-found":
        return S.of(context).UserNotFound;
      case "wrong-password":
        return S.of(context).WrongPassword;
      case "network-request-failed":
        return S.of(context).ThereIsNoInternetConnection;
      case "invalid-credential":
        return S.of(context).InvalidCredential;
      case "too-many-requests":
        return S.of(context).AttemptsHaveBeenTemporarilyBlocked;
      case "operation-not-allowed":
        return S.of(context).LoginWithThisAaccountIsNotEnabled;
      default:
        return S.of(context).AnArrorOccurred;
    }
  }

  static String _handleFirebaseException(
      FirebaseException e, BuildContext context) {
    switch (e.code) {
      case "permission-denied":
        return S.of(context).permissionDenied;
      case "unavailable":
        return S.of(context).firebaseUnavailable;
      case "cancelled":
        return S.of(context).operationCancelled;
      case "not-found":
        return S.of(context).itemNotFound;
      case "already-exists":
        return S.of(context).itemAlreadyExists;
      case "resource-exhausted":
        return S.of(context).resourceExhausted;
      default:
        return S.of(context).firebaseErrors;
    }
  }
}
