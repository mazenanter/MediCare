import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/routing/app_router.dart';
import 'package:medicare/medicare.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
    path: 'assets/translations',
    fallbackLocale: Locale('en', 'US'),
    child: MediCare(
      appRouter: AppRouter(),
    ),
  ));
}
