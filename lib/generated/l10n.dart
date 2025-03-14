// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Change Language`
  String get ChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'ChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `Are you sure you want to change the language?`
  String get SureToChangeLanguage {
    return Intl.message(
      'Are you sure you want to change the language?',
      name: 'SureToChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message('Ok', name: 'Ok', desc: '', args: []);
  }

  /// `Welcome to`
  String get WelcomeTo {
    return Intl.message('Welcome to', name: 'WelcomeTo', desc: '', args: []);
  }

  /// `MediCare`
  String get MediCare {
    return Intl.message('MediCare', name: 'MediCare', desc: '', args: []);
  }

  /// `Your personal assistant for managing\nyour medication schedule.`
  String get YourPersonalAssistantForMmanagingYourMmedicationSchedule {
    return Intl.message(
      'Your personal assistant for managing\nyour medication schedule.',
      name: 'YourPersonalAssistantForMmanagingYourMmedicationSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Register`
  String get Register {
    return Intl.message('Register', name: 'Register', desc: '', args: []);
  }

  /// `Welcome back! Glad\nto see you, Again!`
  String get WelcomeBackGladToSeeYouAgain {
    return Intl.message(
      'Welcome back! Glad\nto see you, Again!',
      name: 'WelcomeBackGladToSeeYouAgain',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 lowercase letter`
  String get AtLeast1LowercaseLetter {
    return Intl.message(
      'At least 1 lowercase letter',
      name: 'AtLeast1LowercaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 uppercase letter`
  String get AtLeast1UppercaseLetter {
    return Intl.message(
      'At least 1 uppercase letter',
      name: 'AtLeast1UppercaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 number`
  String get AtLeast1Number {
    return Intl.message(
      'At least 1 number',
      name: 'AtLeast1Number',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 special character`
  String get AtLeast1SpecialCharacter {
    return Intl.message(
      'At least 1 special character',
      name: 'AtLeast1SpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get AtLeast8Characters {
    return Intl.message(
      'At least 8 characters',
      name: 'AtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get ContinueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'ContinueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get EnterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'EnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get EnterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'EnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet?`
  String get DontHaveAnAccountYet {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'DontHaveAnAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get Or {
    return Intl.message('Or', name: 'Or', desc: '', args: []);
  }

  /// `Hello! Register to get\nstarted`
  String get HelloRegisterToGetStarted {
    return Intl.message(
      'Hello! Register to get\nstarted',
      name: 'HelloRegisterToGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Username`
  String get EnterYourUsername {
    return Intl.message(
      'Enter Your Username',
      name: 'EnterYourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get AlreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'AlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
