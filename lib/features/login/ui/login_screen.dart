import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/routing/routes.dart';
import 'package:medicare/core/widgets/app_text_button.dart';
import 'package:medicare/features/login/ui/widgets/divider_and_or_text.dart';
import 'package:medicare/features/login/ui/widgets/dont_have_account.dart';
import 'package:medicare/features/login/ui/widgets/email_and_password.dart';
import 'package:medicare/features/login/ui/widgets/google_button.dart';
import 'package:medicare/features/login/ui/widgets/login_bloc_listener.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_styles_manager.dart';
import '../../../core/widgets/back_arrow_button.dart';
import '../../../generated/l10n.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackArrowButton(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(Routes.welcomeScreen);
                },
              ),
              verticalSpace(80),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Column(
                  children: [
                    Text(
                      S.of(context).WelcomeBackGladToSeeYouAgain,
                      style: TextStylesManager.font30MainColorBold,
                    ),
                    verticalSpace(32),
                    EmailAndPassword(),
                    //verticalSpace(24),
                    // Align(
                    //   alignment: AlignmentDirectional.centerEnd,
                    //   child: Text(
                    //     S.of(context).ForgotPassword,
                    //     style: TextStylesManager.font14BlueSemiBold,
                    //   ),
                    // ),
                    verticalSpace(33),
                    AppTextButton(
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                      text: S.of(context).Login,
                    ),
                    verticalSpace(33),
                    DividerAndOrText(),
                    verticalSpace(61),
                    GoogleButton(
                      onPressed: () {
                        context
                            .read<LoginCubit>()
                            .signInWithGoogle(context: context);
                      },
                    ),
                    verticalSpace(33),
                    DontHaveAccount(),
                    verticalSpace(33),
                    LoginBlocListener(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(context: context);
    }
  }
}
