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

  /// `Something went wrong, please try again.`
  String get SomethingWentWrongPleaseTtryAgain {
    return Intl.message(
      'Something went wrong, please try again.',
      name: 'SomethingWentWrongPleaseTtryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Email already in use, please use a different email.`
  String get EmailAlreadyInUsePleaseUseADifferentEmail {
    return Intl.message(
      'Email already in use, please use a different email.',
      name: 'EmailAlreadyInUsePleaseUseADifferentEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password too weak!`
  String get PasswordTooWeak {
    return Intl.message(
      'Password too weak!',
      name: 'PasswordTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address, please check and try again.`
  String get InvalidEmailAddressPleaseCheckAndTryAgain {
    return Intl.message(
      'Invalid email address, please check and try again.',
      name: 'InvalidEmailAddressPleaseCheckAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `User not found for that email address.`
  String get UserNotFound {
    return Intl.message(
      'User not found for that email address.',
      name: 'UserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password for that user.`
  String get WrongPassword {
    return Intl.message(
      'Wrong password for that user.',
      name: 'WrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `There is no internet connection, please try again.`
  String get ThereIsNoInternetConnection {
    return Intl.message(
      'There is no internet connection, please try again.',
      name: 'ThereIsNoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Attempts have been temporarily blocked due to too many requests. Please try again later.`
  String get AttemptsHaveBeenTemporarilyBlocked {
    return Intl.message(
      'Attempts have been temporarily blocked due to too many requests. Please try again later.',
      name: 'AttemptsHaveBeenTemporarilyBlocked',
      desc: '',
      args: [],
    );
  }

  /// `Login with this account is not enabled.`
  String get LoginWithThisAaccountIsNotEnabled {
    return Intl.message(
      'Login with this account is not enabled.',
      name: 'LoginWithThisAaccountIsNotEnabled',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during login. Please try again.`
  String get AnArrorOccurred {
    return Intl.message(
      'An error occurred during login. Please try again.',
      name: 'AnArrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `You do not have permission to access this resource.`
  String get permissionDenied {
    return Intl.message(
      'You do not have permission to access this resource.',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Firebase service is currently unavailable. Please try again later.`
  String get firebaseUnavailable {
    return Intl.message(
      'Firebase service is currently unavailable. Please try again later.',
      name: 'firebaseUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `The operation has been canceled.`
  String get operationCancelled {
    return Intl.message(
      'The operation has been canceled.',
      name: 'operationCancelled',
      desc: '',
      args: [],
    );
  }

  /// `The requested item is not found.`
  String get itemNotFound {
    return Intl.message(
      'The requested item is not found.',
      name: 'itemNotFound',
      desc: '',
      args: [],
    );
  }

  /// `This item already exists.`
  String get itemAlreadyExists {
    return Intl.message(
      'This item already exists.',
      name: 'itemAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `You have exceeded the allowed limit. Please try again later.`
  String get resourceExhausted {
    return Intl.message(
      'You have exceeded the allowed limit. Please try again later.',
      name: 'resourceExhausted',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while handling Firebase.`
  String get firebaseErrors {
    return Intl.message(
      'An error occurred while handling Firebase.',
      name: 'firebaseErrors',
      desc: '',
      args: [],
    );
  }

  /// `Email created successfully`
  String get EmailCreatedSuccessfully {
    return Intl.message(
      'Email created successfully',
      name: 'EmailCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message('Success', name: 'Success', desc: '', args: []);
  }

  /// `Error`
  String get Error {
    return Intl.message('Error', name: 'Error', desc: '', args: []);
  }

  /// `Please enter your name`
  String get PleaseEnterYourName {
    return Intl.message(
      'Please enter your name',
      name: 'PleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get PleaseEnterValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'PleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid passowrd`
  String get PleaseEnterValidPassowrd {
    return Intl.message(
      'Please enter valid passowrd',
      name: 'PleaseEnterValidPassowrd',
      desc: '',
      args: [],
    );
  }

  /// `Missing access token or ID token`
  String get MissingAccessTokenOrIDToken {
    return Intl.message(
      'Missing access token or ID token',
      name: 'MissingAccessTokenOrIDToken',
      desc: '',
      args: [],
    );
  }

  /// `Login Success`
  String get LoginSuccess {
    return Intl.message(
      'Login Success',
      name: 'LoginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Email or password is incorrect.`
  String get InvalidCredential {
    return Intl.message(
      'Email or password is incorrect.',
      name: 'InvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Manage your meds`
  String get ManageYourMeds {
    return Intl.message(
      'Manage your meds',
      name: 'ManageYourMeds',
      desc: '',
      args: [],
    );
  }

  /// `Add your meds to be reminded on\ntime and track your health `
  String get AddYourMedsToBeReminded {
    return Intl.message(
      'Add your meds to be reminded on\ntime and track your health ',
      name: 'AddYourMedsToBeReminded',
      desc: '',
      args: [],
    );
  }

  /// `Add medicine`
  String get AddMedicine {
    return Intl.message(
      'Add medicine',
      name: 'AddMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get Today {
    return Intl.message('Today', name: 'Today', desc: '', args: []);
  }

  /// `Intakes`
  String get Intakes {
    return Intl.message('Intakes', name: 'Intakes', desc: '', args: []);
  }

  /// `Tablet`
  String get Tablet {
    return Intl.message('Tablet', name: 'Tablet', desc: '', args: []);
  }

  /// `Capsule`
  String get Capsule {
    return Intl.message('Capsule', name: 'Capsule', desc: '', args: []);
  }

  /// `Injection`
  String get Injection {
    return Intl.message('Injection', name: 'Injection', desc: '', args: []);
  }

  /// `Drop`
  String get Drop {
    return Intl.message('Drop', name: 'Drop', desc: '', args: []);
  }

  /// `Name*`
  String get Name {
    return Intl.message('Name*', name: 'Name', desc: '', args: []);
  }

  /// `Type*`
  String get Type {
    return Intl.message('Type*', name: 'Type', desc: '', args: []);
  }

  /// `Dose*`
  String get Dose {
    return Intl.message('Dose*', name: 'Dose', desc: '', args: []);
  }

  /// `Time*`
  String get Time {
    return Intl.message('Time*', name: 'Time', desc: '', args: []);
  }

  /// `Add`
  String get Add {
    return Intl.message('Add', name: 'Add', desc: '', args: []);
  }

  /// `Amount*`
  String get Amount {
    return Intl.message('Amount*', name: 'Amount', desc: '', args: []);
  }

  /// `First Date*`
  String get FirstDate {
    return Intl.message('First Date*', name: 'FirstDate', desc: '', args: []);
  }

  /// `Reminders`
  String get Reminders {
    return Intl.message('Reminders', name: 'Reminders', desc: '', args: []);
  }

  /// `Name (e.g. Ibuprofen)`
  String get NameEG {
    return Intl.message(
      'Name (e.g. Ibuprofen)',
      name: 'NameEG',
      desc: '',
      args: [],
    );
  }

  /// `Type (e.g. Tablet)`
  String get TypeEG {
    return Intl.message(
      'Type (e.g. Tablet)',
      name: 'TypeEG',
      desc: '',
      args: [],
    );
  }

  /// `Dose (e.g. 400mg)`
  String get DoseEG {
    return Intl.message(
      'Dose (e.g. 400mg)',
      name: 'DoseEG',
      desc: '',
      args: [],
    );
  }

  /// `Amount (e.g. 2)`
  String get AmountEG {
    return Intl.message(
      'Amount (e.g. 2)',
      name: 'AmountEG',
      desc: '',
      args: [],
    );
  }

  /// `Add New Medicine`
  String get AddNewMedicine {
    return Intl.message(
      'Add New Medicine',
      name: 'AddNewMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Add Reminder`
  String get AddReminder {
    return Intl.message(
      'Add Reminder',
      name: 'AddReminder',
      desc: '',
      args: [],
    );
  }

  /// `Fill out the fields and hit the Save\nButton to add it!`
  String get FillOutTheFields {
    return Intl.message(
      'Fill out the fields and hit the Save\nButton to add it!',
      name: 'FillOutTheFields',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `Medication added successfully`
  String get MedicationAddedSuccessfully {
    return Intl.message(
      'Medication added successfully',
      name: 'MedicationAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `User not logged in`
  String get UserNotLoggedIn {
    return Intl.message(
      'User not logged in',
      name: 'UserNotLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Did you take your Medicine?`
  String get DidYouTakeYourMedicine {
    return Intl.message(
      'Did you take your Medicine?',
      name: 'DidYouTakeYourMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled for`
  String get ScheduledFor {
    return Intl.message(
      'Scheduled for',
      name: 'ScheduledFor',
      desc: '',
      args: [],
    );
  }

  /// `Take`
  String get Take {
    return Intl.message('Take', name: 'Take', desc: '', args: []);
  }

  /// `Edit`
  String get Edit {
    return Intl.message('Edit', name: 'Edit', desc: '', args: []);
  }

  /// `One time`
  String get OneTime {
    return Intl.message('One time', name: 'OneTime', desc: '', args: []);
  }

  /// `Daily`
  String get Daily {
    return Intl.message('Daily', name: 'Daily', desc: '', args: []);
  }

  /// `Every X hours`
  String get EveryXHours {
    return Intl.message(
      'Every X hours',
      name: 'EveryXHours',
      desc: '',
      args: [],
    );
  }

  /// `Repeat every*`
  String get RepeatEvery {
    return Intl.message(
      'Repeat every*',
      name: 'RepeatEvery',
      desc: '',
      args: [],
    );
  }

  /// `Select repeat time`
  String get SelectRepeatTime {
    return Intl.message(
      'Select repeat time',
      name: 'SelectRepeatTime',
      desc: '',
      args: [],
    );
  }

  /// `Hours*`
  String get Hours {
    return Intl.message('Hours*', name: 'Hours', desc: '', args: []);
  }

  /// `(e.g. 2 hours)`
  String get EG2Hours {
    return Intl.message('(e.g. 2 hours)', name: 'EG2Hours', desc: '', args: []);
  }

  /// `Days*`
  String get Days {
    return Intl.message('Days*', name: 'Days', desc: '', args: []);
  }

  /// `(e.g. 2 Days)`
  String get EG2Days {
    return Intl.message('(e.g. 2 Days)', name: 'EG2Days', desc: '', args: []);
  }

  /// `Deleted successfully`
  String get DeletedSuccessfully {
    return Intl.message(
      'Deleted successfully',
      name: 'DeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Delete Medication`
  String get DeleteMedication {
    return Intl.message(
      'Delete Medication',
      name: 'DeleteMedication',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this medication?`
  String get AreYouSureYouWantToDeleteThisMedication {
    return Intl.message(
      'Are you sure you want to delete this medication?',
      name: 'AreYouSureYouWantToDeleteThisMedication',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message('Delete', name: 'Delete', desc: '', args: []);
  }

  /// `Hours for`
  String get HoursFor {
    return Intl.message('Hours for', name: 'HoursFor', desc: '', args: []);
  }

  /// `Medication taken successfully`
  String get MedicationTakenSuccessfully {
    return Intl.message(
      'Medication taken successfully',
      name: 'MedicationTakenSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Medication not taken successfully`
  String get MedicationNotTakenSuccessfully {
    return Intl.message(
      'Medication not taken successfully',
      name: 'MedicationNotTakenSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `updated successfully`
  String get updatedSuccessfully {
    return Intl.message(
      'updated successfully',
      name: 'updatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message('About', name: 'About', desc: '', args: []);
  }

  /// `Contact Us`
  String get ContactUs {
    return Intl.message('Contact Us', name: 'ContactUs', desc: '', args: []);
  }

  /// `Logout`
  String get Logout {
    return Intl.message('Logout', name: 'Logout', desc: '', args: []);
  }

  /// `View`
  String get View {
    return Intl.message('View', name: 'View', desc: '', args: []);
  }

  /// `About the App`
  String get AboutTheApp {
    return Intl.message(
      'About the App',
      name: 'AboutTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Our Mission`
  String get OurMission {
    return Intl.message('Our Mission', name: 'OurMission', desc: '', args: []);
  }

  /// `We strive to improve medication adherence and enhance health outcomes by providing easy-to-use tools for medication management.`
  String
  get Westrivetoimprovemedicationadherenceandenhancehealthoutcomesbyprovidingeasytousetoolsformedicationmanagement {
    return Intl.message(
      'We strive to improve medication adherence and enhance health outcomes by providing easy-to-use tools for medication management.',
      name:
          'Westrivetoimprovemedicationadherenceandenhancehealthoutcomesbyprovidingeasytousetoolsformedicationmanagement',
      desc: '',
      args: [],
    );
  }

  /// `Key Features`
  String get KeyFeatures {
    return Intl.message(
      'Key Features',
      name: 'KeyFeatures',
      desc: '',
      args: [],
    );
  }

  /// `1. Medication Reminders\n2. Drug Information\n3. Health Tracking\n4. User-Friendly Interface`
  String
  get MedicationReminders2DrugInformation3HealthTracking4UserFriendlyInterface {
    return Intl.message(
      '1. Medication Reminders\n2. Drug Information\n3. Health Tracking\n4. User-Friendly Interface',
      name:
          'MedicationReminders2DrugInformation3HealthTracking4UserFriendlyInterface',
      desc: '',
      args: [],
    );
  }

  /// `Version & Information`
  String get VersionInformation {
    return Intl.message(
      'Version & Information',
      name: 'VersionInformation',
      desc: '',
      args: [],
    );
  }

  /// `Version: 1.0.0\nRelease Date: June 2025\nDeveloped by: `
  String get VersionReleaseDateJuneDevelopedby {
    return Intl.message(
      'Version: 1.0.0\nRelease Date: June 2025\nDeveloped by: ',
      name: 'VersionReleaseDateJuneDevelopedby',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Phone`
  String get Phone {
    return Intl.message('Phone', name: 'Phone', desc: '', args: []);
  }

  /// `Are you sure you want to logout?`
  String get AreYouSureYouWantToLogout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'AreYouSureYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Logout successfully`
  String get LogoutSuccessfully {
    return Intl.message(
      'Logout successfully',
      name: 'LogoutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Medication Reminders`
  String get MedicationReminders {
    return Intl.message(
      'Medication Reminders',
      name: 'MedicationReminders',
      desc: '',
      args: [],
    );
  }

  /// `Time to take your medication`
  String get Timetotakeyourmedication {
    return Intl.message(
      'Time to take your medication',
      name: 'Timetotakeyourmedication',
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
