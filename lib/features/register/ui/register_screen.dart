import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/register/ui/widgets/already_have_an_account.dart';
import 'package:medicare/features/register/ui/widgets/register_bloc_listener.dart';
import 'package:medicare/features/register/ui/widgets/register_form.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_styles_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/back_arrow_button.dart';
import '../../../generated/l10n.dart';
import '../../login/ui/widgets/divider_and_or_text.dart';
import '../../login/ui/widgets/google_button.dart';
import '../logic/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackArrowButton(),
              verticalSpace(59),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Column(
                  children: [
                    Text(
                      S.of(context).HelloRegisterToGetStarted,
                      style: TextStylesManager.font30MainColorBold,
                    ),
                    verticalSpace(32),
                    RegisterForm(),
                    verticalSpace(33),
                    AppTextButton(
                      onPressed: () {
                        validateThenDoRegister(context);
                      },
                      text: S.of(context).Register,
                    ),
                    verticalSpace(33),
                    DividerAndOrText(),
                    verticalSpace(61),
                    GoogleButton(),
                    verticalSpace(33),
                    AlreadyHaveAnAccount(),
                    verticalSpace(33),
                    RegisterBlocListener(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterUserState();
    }
  }
}
