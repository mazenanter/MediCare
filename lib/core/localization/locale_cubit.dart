import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));

  bool get isArabic => state.languageCode == 'ar';
  void toggleLanguage() {
    emit(isArabic ? Locale('en') : const Locale('ar'));
  }
}
