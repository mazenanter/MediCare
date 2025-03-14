import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:medicare/core/networking/firebase_auth_service.dart';
import 'package:medicare/core/networking/firestore_service.dart';
import 'package:medicare/features/register/data/repo/register_repo.dart';
import 'package:medicare/features/register/logic/register_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // firebase auth service & firestore service
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseAuthService>(
      () => FirebaseAuthService(getIt<FirebaseAuth>()));
  getIt.registerLazySingleton<FirestoreService>(
      () => FirestoreService(getIt<FirebaseFirestore>()));

  // register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(
        getIt<FirebaseAuthService>(),
        getIt<FirestoreService>(),
      ));
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepo>()));
}
