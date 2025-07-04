import 'package:flutter/material.dart';
import 'package:medicare/core/database/database_service.dart';
import 'package:medicare/core/helpers/constants.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';

import '../../../../core/networking/firebase_error_handler.dart';
import '../../../../core/networking/firestore_service.dart';
import '../../../../core/networking/network_service.dart';

class HomeRepo {
  final FirestoreService firestoreService;
  HomeRepo(this.firestoreService);

  Future<FirebaseResult<List<MedicationResponseModel>>> getMedications(
      String userId, BuildContext context) async {
    try {
      final isOnline = await NetworkService.hasInternetConnection();
      List<MedicationResponseModel> medications;
      if (isOnline) {
        medications = await getFromFirebase(userId);
      } else {
        medications = await getFromLocalDatabase();
      }

      return FirebaseResult.success(medications);
    } catch (e) {
      return FirebaseResult.error(
        FirebaseErrorHandler.getErrorMessage(e, context),
      );
    }
  }

  Future<List<MedicationResponseModel>> getFromFirebase(String userId) async {
    try {
      final List<Map<String, dynamic>> response =
          await firestoreService.getMedications(userId);
      return response.map((medicine) {
        return MedicationResponseModel.fromJson(medicine);
      }).toList();
    } catch (e) {
      debugPrint("🔥 Firebase Error: $e");
      return [];
    }
  }

  Future<List<MedicationResponseModel>> getFromLocalDatabase() async {
    try {
      final queries =
          await DatabaseService.getAllMedications(AppConstants.tableName);
      return queries.map((medicine) {
        return MedicationResponseModel.fromJson(medicine);
      }).toList();
    } catch (e) {
      debugPrint("🔥 Local DB Error: $e");
      return [];
    }
  }
}
