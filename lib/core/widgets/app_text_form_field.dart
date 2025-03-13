import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.focusedBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputTextStyle,
      required this.hintText,
      this.contentPadding,
      this.obsucreText,
      this.suffixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator});
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final bool? obsucreText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      obscureText: obsucreText ?? false,
      decoration: InputDecoration(
        filled: true,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        hintStyle: hintStyle ?? TextStylesManager.font15Meduim,
        hintText: hintText,
        fillColor: ColorsManager.cF7F8F9,
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
