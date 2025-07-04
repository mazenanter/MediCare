import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/l10n.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations(
      {super.key,
      required this.hasUpperCase,
      required this.hasLowerCase,
      required this.hasNumber,
      required this.hasSpecialCharacter,
      required this.hasMinLength});
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2.h,
      children: [
        buildValidationRow(S.of(context).AtLeast1LowercaseLetter, hasLowerCase),
        buildValidationRow(S.of(context).AtLeast1UppercaseLetter, hasUpperCase),
        buildValidationRow(S.of(context).AtLeast1Number, hasNumber),
        buildValidationRow(
            S.of(context).AtLeast1SpecialCharacter, hasSpecialCharacter),
        buildValidationRow(S.of(context).AtLeast8Characters, hasMinLength),
      ],
    );
  }

  buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.c196EB0,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStylesManager.font14Regular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.cB8B8B8 : ColorsManager.c196EB0,
          ),
        ),
      ],
    );
  }
}
