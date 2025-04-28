import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:medicare/core/networking/firebase_auth_service.dart';
import 'package:medicare/core/networking/firestore_service.dart';
import 'package:medicare/features/register/data/repo/register_repo.dart';
import 'package:medicare/features/register/logic/register_cubit.dart';

import '../../features/add_med/data/repo/add_med_repo.dart';
import '../../features/add_med/logic/add_med_cubit.dart';
import '../../features/details/data/repo/details_repo.dart';
import '../../features/details/logic/details_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';

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

  // login
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(getIt<FirebaseAuthService>(), getIt<FirestoreService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // add medication
  getIt.registerLazySingleton<AddMedRepo>(
      () => AddMedRepo(getIt<FirestoreService>()));
  getIt.registerFactory<AddMedCubit>(() => AddMedCubit(getIt<AddMedRepo>()));

  // home
  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepo(getIt<FirestoreService>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // details
  getIt.registerLazySingleton<DetailsRepo>(
      () => DetailsRepo(getIt<FirestoreService>()));
  getIt.registerFactory<DetailsCubit>(() => DetailsCubit(getIt<DetailsRepo>()));
}
