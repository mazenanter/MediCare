import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/core/di/dependency_injection.dart';
import 'package:medicare/core/routing/routes.dart';
import 'package:medicare/features/home/ui/home_screen.dart';
import 'package:medicare/features/login/logic/login_cubit.dart';
import 'package:medicare/features/login/ui/login_screen.dart';
import 'package:medicare/features/register/logic/register_cubit.dart';
import 'package:medicare/features/welcome/welcome_screen.dart';

import '../../features/home/ui/manage_med_screen.dart';
import '../../features/register/ui/register_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: RegisterScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.manageMedScreen:
        return MaterialPageRoute(
          builder: (context) => const ManageMedScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
