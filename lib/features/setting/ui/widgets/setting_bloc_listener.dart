import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/widgets/toast_message.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/setting_cubit.dart';
import '../../logic/setting_state.dart';

class SettingBlocListener extends StatelessWidget {
  const SettingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingCubit, SettingState>(
      listenWhen: (previous, current) =>
          current is SignOut ||
          current is SignOutError ||
          current is ProfileLoading ||
          current is ProfileSuccess ||
          current is ProfileError,
      listener: (context, state) {
        state.whenOrNull(
          signOut: () {
            ToastMessage.successToast(
              context,
              S.of(context).LogoutSuccessfully,
            );
            context.pushNamedAndRemoveUntil(Routes.loginScreen);
          },
          signOutError: (message) {
            ToastMessage.errorToast(
              context,
              message,
            );
          },
          profileLoading: () {
            // Handle profile loading state
          },
          profileSuccess: () {
            // Handle profile success state
          },
          profileError: (message) {
            // Handle profile error state
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
