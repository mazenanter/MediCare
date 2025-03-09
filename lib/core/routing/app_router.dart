import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/core/routing/routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
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
