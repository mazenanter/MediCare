import 'package:flutter/material.dart';
import 'package:medicare/features/login/ui/widgets/email_and_password.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_styles_manager.dart';
import '../../../core/widgets/back_arrow_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackArrowButton(),
            verticalSpace(80),
            Text(
              'Welcome back! Glad\nto see you, Again!',
              style: TextStylesManager.font30MainColorBold,
            ),
            verticalSpace(32),
            EmailAndPassword(),
          ],
        ),
      ),
    );
  }
}
