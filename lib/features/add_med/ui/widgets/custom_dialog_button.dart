import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton(
      {super.key,
      required this.text,
      this.buttonColor,
      this.textColor,
      required this.onPressed});
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppTextButton(
        onPressed: onPressed,
        text: text,
        buttonHeight: 56,
        buttonColor: buttonColor ?? ColorsManager.c196EB0,
        buttonWidth: 0,
        borderRadius: 12,
        textColor: textColor ?? ColorsManager.cFFFFFF,
      ),
    );
  }
}
