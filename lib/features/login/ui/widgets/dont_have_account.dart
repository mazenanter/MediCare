import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'Don\'t have an account yet?',
              style: TextStylesManager.font15Meduim.copyWith(
                color: Colors.black,
              )),
          TextSpan(
            text: 'Sign Up',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.registerScreen);
              },
            style: TextStylesManager.font15Bold.copyWith(
              color: ColorsManager.c196EB0,
            ),
          ),
        ],
      ),
    );
  }
}
