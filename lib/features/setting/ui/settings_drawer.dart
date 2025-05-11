import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/features/setting/logic/setting_cubit.dart';
import 'package:medicare/features/setting/ui/widgets/about.dart';
import 'package:medicare/features/setting/ui/widgets/contact_us.dart';
import 'package:medicare/features/setting/ui/widgets/custom_drawer_header.dart';
import 'package:medicare/features/setting/ui/widgets/languages_toggle.dart';
import 'package:medicare/features/setting/ui/widgets/logout_button.dart';
import 'package:medicare/features/setting/ui/widgets/notification_toggle.dart';
import 'package:medicare/features/setting/ui/widgets/setting_bloc_listener.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          CustomDrawerHeader(),
          verticalSpace(26),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                LanguagesToggle(),
                verticalSpace(30),
                NotificationToggle(),
                verticalSpace(30),
                About(),
                verticalSpace(30),
                ContactUs(),
                verticalSpace(66),
                LogoutButton(
                  settingCubit: context.read<SettingCubit>(),
                ),
                SettingBlocListener(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
