import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/widgets/app_text_form_field.dart';
import 'package:medicare/features/login/ui/widgets/password_validations.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: 'Enter your email',
          validator: (p0) {},
        ),
        verticalSpace(15),
        AppTextFormField(
          obsucreText: isObscure,
          hintText: 'Enter your password',
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
