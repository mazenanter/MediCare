import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/generated/l10n.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: S.of(context).EnterYourUsername,
          validator: (p0) {},
        ),
        verticalSpace(12),
        AppTextFormField(
          hintText: S.of(context).EnterYourEmail,
          validator: (p0) {},
        ),
        verticalSpace(12),
        AppTextFormField(
          obsucreText: isObscure,
          hintText: S.of(context).EnterYourPassword,
          validator: (p0) {},
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
          obsucreText: isObscure,
          hintText: S.of(context).ConfirmPassword,
          validator: (p0) {},
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
    );
  }
}
