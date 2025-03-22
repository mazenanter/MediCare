import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/networking/firebase_error_handler.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/core/networking/firestore_service.dart';
import 'package:medicare/features/add_med/data/model/add_med_request_model.dart';

class AddMedRepo {
  final FirestoreService firestoreService;

  AddMedRepo(this.firestoreService);

  Future<FirebaseResult<String>> addMedication(
      AddMedRequestModel addMedRequestModel, BuildContext context) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return FirebaseResult.error("User is not logged in");
    }
    try {
      await firestoreService.addMedication(user.uid, addMedRequestModel);
      return FirebaseResult.success("Medication added successfully");
    } catch (e) {
      return FirebaseResult.error(
        FirebaseErrorHandler.getErrorMessage(e, context),
      );
    }
  }
}
