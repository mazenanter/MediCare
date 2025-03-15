import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/features/register/logic/register_cubit.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../login/ui/widgets/password_validations.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
    passwordController = context.read<RegisterCubit>().passwordController;

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
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<RegisterCubit>().usernameController,
            hintText: S.of(context).EnterYourUsername,
            validator: (value) {
              if (value!.isEmpty) {
                return S.of(context).PleaseEnterYourName;
              }
              return null;
            },
          ),
          verticalSpace(12),
          AppTextFormField(
            controller: context.read<RegisterCubit>().emailController,
            hintText: S.of(context).EnterYourEmail,
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return S.of(context).PleaseEnterValidEmail;
              }
              return null;
            },
          ),
          verticalSpace(12),
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
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
          verticalSpace(12),
          AppTextFormField(
            controller: context.read<RegisterCubit>().confirmPasswordController,
            obsucreText: isObscure,
            hintText: S.of(context).ConfirmPassword,
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
