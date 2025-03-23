import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/networking/firebase_error_handler.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/core/networking/firestore_service.dart';
import 'package:medicare/features/add_med/data/model/add_med_request_model.dart';

import '../../../../generated/l10n.dart';

class AddMedRepo {
  final FirestoreService firestoreService;

  AddMedRepo(this.firestoreService);

  Future<FirebaseResult<String>> addMedication(
      AddMedRequestModel addMedRequestModel, BuildContext context) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return FirebaseResult.error(S.of(context).UserNotLoggedIn);
    }
    try {
      await firestoreService.addMedication(user.uid, addMedRequestModel);
      return FirebaseResult.success(S.of(context).MedicationAddedSuccessfully);
    } catch (e) {
      return FirebaseResult.error(
        FirebaseErrorHandler.getErrorMessage(e, context),
      );
    }
  }
}
