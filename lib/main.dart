import 'package:flutter/material.dart';
import 'package:medicare/core/routing/app_router.dart';
import 'package:medicare/medicare.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MediCare(
    appRouter: AppRouter(),
  ));
}
