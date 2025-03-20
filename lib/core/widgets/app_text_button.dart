import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonColor,
    this.buttonWidth,
    this.buttonHeight,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.textColor,
    this.hintStyle,
  });
  final void Function() onPressed;
  final String text;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? textColor;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(
          buttonWidth?.w ?? double.maxFinite,
          buttonHeight?.h ?? 56.36.h,
        )),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
            buttonColor ?? ColorsManager.c196EB0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            side: BorderSide(color: ColorsManager.c196EB0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: hintStyle?.copyWith(
              color: textColor ?? ColorsManager.cFFFFFF,
            ) ??
            TextStylesManager.font15Bold.copyWith(
              color: textColor ?? ColorsManager.cFFFFFF,
            ),
      ),
    );
  }
}
