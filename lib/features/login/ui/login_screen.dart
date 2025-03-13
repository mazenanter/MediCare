import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/widgets/app_text_button.dart';
import 'package:medicare/features/login/ui/widgets/divider_and_or_text.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: Column(
                children: [
                  Text(
                    'Welcome back! Glad\nto see you, Again!',
                    style: TextStylesManager.font30MainColorBold,
                  ),
                  verticalSpace(32),
                  EmailAndPassword(),
                  verticalSpace(24),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Forgot Password?',
                      style: TextStylesManager.font14BlueSemiBold,
                    ),
                  ),
                  verticalSpace(33),
                  AppTextButton(
                    onPressed: () {},
                    text: 'Login',
                  ),
                  verticalSpace(33),
                  DividerAndOrText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
