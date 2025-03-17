import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/widgets/app_text_form_field.dart';
import 'package:medicare/features/login/ui/widgets/password_validations.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscure = true;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;

    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        hasUpperCase = AppRegex.hasUpperCase(password);
        hasLowerCase = AppRegex.hasLowerCase(password);
        hasNumber = AppRegex.hasNumber(password);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: S.of(context).EnterYourEmail,
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return S.of(context).PleaseEnterValidEmail;
              }
              return null;
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            obsucreText: isObscure,
            hintText: S.of(context).EnterYourPassword,
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isPasswordValid(value)) {
                return S.of(context).PleaseEnterValidPassowrd;
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Icon(
                isObscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                size: 19,
              ),
            ),
          ),
          verticalSpace(24),
          PasswordValidations(
            hasUpperCase: hasUpperCase,
            hasLowerCase: hasLowerCase,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
