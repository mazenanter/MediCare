import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/di/dependency_injection.dart';
import 'package:medicare/core/routing/app_router.dart';
import 'package:medicare/firebase_options.dart';
import 'package:medicare/medicare.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MediCare(
    appRouter: AppRouter(),
  ));
}
