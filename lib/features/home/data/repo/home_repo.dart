import 'package:flutter/material.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';

import '../../../../core/networking/firebase_error_handler.dart';
import '../../../../core/networking/firestore_service.dart';

class HomeRepo {
  final FirestoreService firestoreService;
  HomeRepo(this.firestoreService);

  Future<FirebaseResult<List<MedicationResponseModel>>> getMedications(
      String userId, BuildContext context) async {
    try {
      final List<Map<String, dynamic>> response =
          await firestoreService.getMedications(userId);

      final medications = response.map((e) {
        try {
          return MedicationResponseModel.fromJson(e);
        } catch (e) {
          debugPrint("🔥 Error converting fromJson: $e");
          throw Exception("Invalid data format");
        }
      }).toList();

      return FirebaseResult.success(medications);
    } catch (e) {
      return FirebaseResult.error(
        FirebaseErrorHandler.getErrorMessage(e, context),
      );
    }
  }
}
