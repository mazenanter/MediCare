import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/widgets/app_text_button.dart';

import '../../../../generated/l10n.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonColor: ColorsManager.cEA4335,
      buttonWidth: 150.w,
      borderColor: ColorsManager.cEA4335,
      onPressed: () {},
      text: S.of(context).Logout,
    );
  }
}
