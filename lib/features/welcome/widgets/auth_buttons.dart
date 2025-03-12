import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/routing/routes.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/widgets/app_text_button.dart';

import '../../../../generated/l10n.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        children: [
          AppTextButton(
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
            text: S.of(context).Login,
          ),
          verticalSpace(15),
          AppTextButton(
            buttonColor: ColorsManager.cFFFFFF,
            textColor: ColorsManager.c196EB0,
            onPressed: () {
              context.pushNamed(Routes.registerScreen);
            },
            text: S.of(context).Register,
          ),
        ],
      ),
    );
  }
}
