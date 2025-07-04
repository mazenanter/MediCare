import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/database/database_service.dart';
import 'package:medicare/core/networking/firebase_error_handler.dart';
import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/core/networking/firestore_service.dart';
import 'package:medicare/core/networking/network_service.dart';
import 'package:medicare/features/add_med/data/model/add_med_request_model.dart';

import '../../../../core/helpers/constants.dart';
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
      final isOnline = await NetworkService.hasInternetConnection();

      await DatabaseService.insert(AppConstants.tableName, {
        ...addMedRequestModel.toJson(),
        'isSynced': isOnline ? 1 : 0,
      });

      if (isOnline) {
        await firestoreService.addMedication(user.uid, addMedRequestModel);
      }
      return FirebaseResult.success(S.of(context).MedicationAddedSuccessfully);
    } catch (e) {
      return FirebaseResult.error(
        FirebaseErrorHandler.getErrorMessage(e, context),
      );
    }
  }

  syncOfflineMedications() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    if (await NetworkService.hasInternetConnection()) {
      log("الإنترنت رجع! جاري مزامنة الأدوية...");
      final List<Map<String, dynamic>> unsyncedMedications =
          await DatabaseService.getUnsyncedMedications();
      log("📝 عدد الأدوية غير المرفوعة: ${unsyncedMedications.length}");
      for (var medication in unsyncedMedications) {
        log("⬆️ جاري رفع الدواء: ${medication['name']}");
        await firestoreService.addMedication(
            user.uid, AddMedRequestModel.fromJson(medication));
        await DatabaseService.updateMedicationSyncStatus(
            medication['id'].toString());

        log("✅ تم مزامنة الدواء بنجاح!");
      }

      final List<Map<String, dynamic>> pendingOperations =
          await DatabaseService.getPendingOperations();
      log("📝 عدد العمليات المعلقة: ${pendingOperations.length}");
      for (var operation in pendingOperations) {
        log("⬆️ جاري رفع العملية: ${operation['operationType']}");
        if (operation['operationType'] == 'delete') {
          await firestoreService.deleteMedication(
              user.uid, operation['medicationId']);
          await DatabaseService.deletePendingOperation(operation['id']);
          log("✅ تم مزامنة العملية بنجاح!");
        } else if (operation['operationType'] == 'update') {
          final medication = await DatabaseService.getMedicationById(
              operation['medicationId']);
          await firestoreService.updateMedication(
              user.uid,
              operation['medicationId'],
              AddMedRequestModel.fromJson(medication));
          await DatabaseService.deletePendingOperation(operation['id']);
          log("✅ تم مزامنة العملية بنجاح!");
        } else if (operation['operationType'] == 'take') {
          await firestoreService.updateTakeMedication(
              user.uid, operation['medicationId'], operation['isTaken']);
          await DatabaseService.deletePendingOperation(operation['id']);
          log("✅ تم مزامنة العملية بنجاح!");
        }
      }
    }
  }
}
