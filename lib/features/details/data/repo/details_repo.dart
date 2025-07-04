import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/helpers/constants.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/features/add_med/data/model/add_med_request_model.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/database/database_service.dart';
import '../../../../core/networking/firestore_service.dart';
import '../../../../core/networking/network_service.dart';

class DetailsRepo {
  final FirestoreService firestoreService;

  DetailsRepo(this.firestoreService);

  Future<FirebaseResult<void>> deleteMedication(
      {required String medicationId}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      await DatabaseService.delete(AppConstants.tableName, medicationId);
      final isOnline = await NetworkService.hasInternetConnection();
      if (isOnline && userId != null) {
        await firestoreService.deleteMedication(userId, medicationId);
      } else {
        await DatabaseService.insert(AppConstants.pendingOperationsTaple, {
          'operationType': 'delete',
          'medicationId': medicationId,
          'userId': userId,
          'createdAt': DateTime.now().millisecondsSinceEpoch,
        });
      }

      return FirebaseResult.success(null);
    } catch (e) {
      return FirebaseResult.error(e.toString());
    }
  }

  Future<FirebaseResult<String>> updateMedication(
      {required String medicationId,
      required AddMedRequestModel model,
      required BuildContext context}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      await DatabaseService.update(
          AppConstants.tableName, model.toJson(), medicationId);
      final isOnline = await NetworkService.hasInternetConnection();
      if (isOnline && userId != null) {
        await firestoreService.updateMedication(userId, medicationId, model);
      } else {
        await DatabaseService.insert(AppConstants.pendingOperationsTaple, {
          'operationType': 'update',
          'medicationId': medicationId,
          'userId': userId,
          'createdAt': DateTime.now().millisecondsSinceEpoch,
        });
      }

      return FirebaseResult.success(
          "${model.name} ${S.of(context).updatedSuccessfully}");
    } catch (e) {
      return FirebaseResult.error(e.toString());
    }
  }

  Future<FirebaseResult<String>> takeMedication(
      {required String medicationId,
      required int isTaken,
      required BuildContext context}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      await DatabaseService.update(
          AppConstants.tableName, {'isTaken': isTaken}, medicationId);
      final isOnline = await NetworkService.hasInternetConnection();
      if (isOnline && userId != null) {
        await firestoreService.updateTakeMedication(
            userId, medicationId, isTaken);
      } else {
        await DatabaseService.insert(AppConstants.pendingOperationsTaple, {
          'operationType': 'take',
          'medicationId': medicationId,
          'userId': userId,
          'createdAt': DateTime.now().millisecondsSinceEpoch,
        });
      }
      if (isTaken == 1) {
        return FirebaseResult.success(
            S.of(context).MedicationTakenSuccessfully);
      } else {
        return FirebaseResult.success(
            S.of(context).MedicationNotTakenSuccessfully);
      }
    } catch (e) {
      return FirebaseResult.error(e.toString());
    }
  }
}
