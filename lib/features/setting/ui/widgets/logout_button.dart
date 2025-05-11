import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/widgets/app_text_button.dart';
import 'package:medicare/core/widgets/custom_alert_dialog.dart';

import '../../../../core/theming/text_styles_manager.dart';
import '../../../../generated/l10n.dart';
import '../../logic/setting_cubit.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.settingCubit});
  final SettingCubit settingCubit;
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonColor: ColorsManager.cEA4335,
      buttonWidth: 150.w,
      borderColor: ColorsManager.cEA4335,
      onPressed: () {
        dialog(context);
      },
      text: S.of(context).Logout,
    );
  }

  Future<dynamic> dialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          icon: const Icon(
            Icons.logout,
            color: ColorsManager.cEA4335,
            size: 40,
          ),
          content: S.of(context).AreYouSureYouWantToLogout,
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                S.of(context).Cancel,
                style: TextStylesManager.font16Bold.copyWith(
                  color: ColorsManager.c196EB0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                settingCubit.logoutUser();
                context.pop();
              },
              child: Text(
                S.of(context).Logout,
                style: TextStylesManager.font16Bold.copyWith(
                  color: ColorsManager.cEA4335,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
