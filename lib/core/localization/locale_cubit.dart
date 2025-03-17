import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/core/helpers/constants.dart';
import 'package:medicare/core/helpers/shared_pref_helper.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')) {
    // get language when app starts
    _loadSavedLocale();
  }

  bool get isArabic => state.languageCode == 'ar';
  void changeLanguage(Locale locale) async {
    emit(locale);
    await SharedPrefHelper.saveData(
        AppConstants.lnaguageKey, locale.languageCode);
  }

  Future<void> _loadSavedLocale() async {
    final savedLocale =
        await SharedPrefHelper.getString(AppConstants.lnaguageKey);

    if (savedLocale != null) {
      emit(Locale(savedLocale));
    }
  }
}
