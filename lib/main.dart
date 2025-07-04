import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/di/dependency_injection.dart';
import 'package:medicare/core/helpers/constants.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/helpers/notification_service.dart';
import 'package:medicare/core/helpers/shared_pref_helper.dart';
import 'package:medicare/core/networking/firestore_service.dart';
import 'package:medicare/core/networking/network_service.dart';
import 'package:medicare/core/routing/app_router.dart';
import 'package:medicare/features/add_med/data/repo/add_med_repo.dart';
import 'package:medicare/firebase_options.dart';
import 'package:medicare/medicare.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initializeNotification();
  NetworkService.listenToConnectionChanges(() {
    final addMedRepo = AddMedRepo(FirestoreService(FirebaseFirestore.instance));
    addMedRepo.syncOfflineMedications();
  });
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  await Workmanager().registerPeriodicTask(
    "syncMedicationsTask",
    "syncMedications",
    frequency: Duration(minutes: 15),
  );
  setupGetIt();
  await checkIfLoggedIn();
  // to fix text hidden bug in flutter screen util in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(MediCare(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedIn() async {
  String? userId = await SharedPrefHelper.getSecuredData(AppConstants.userId);
  if (!userId.isNullOrEmpty) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}

void callbackDispatcher() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().executeTask((task, inputData) async {
    if (task == "syncMedications") {
      final addMedRepo =
          AddMedRepo(FirestoreService(FirebaseFirestore.instance));
      await addMedRepo.syncOfflineMedications();
    }
    return Future.value(true);
  });
}
