import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class AddMedFormField extends StatelessWidget {
  const AddMedFormField(
      {super.key,
      required this.hintText,
      this.prefIcon,
      this.contentPadding,
      this.readOnly,
      this.isDropDown = false,
      this.selectedValue,
      this.dropdownItems,
      this.onChanged,
      required this.controller});
  final String hintText;
  final Widget? prefIcon;
  final double? contentPadding;
  final bool? readOnly;
  final bool isDropDown;
  final String? selectedValue;
  final List<String>? dropdownItems;
  final TextEditingController controller;
  final ValueChanged<String?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return isDropDown
        ? DropdownButtonFormField<String>(
            dropdownColor: ColorsManager.cFFFFFF,
            focusColor: ColorsManager.c196EB0,
            icon: Icon(
              Icons.arrow_drop_down,
              size: 24.sp,
            ),
            value: selectedValue,
            hint: Text(hintText),
            items: dropdownItems?.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStylesManager.font19Regular.copyWith(
                    color: ColorsManager.c196EB0,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorsManager.c196EB0,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorsManager.cBBBBBB,
                  width: 1.5,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
          )
        : TextFormField(
            controller: controller,
            readOnly: readOnly ?? false,
            style: TextStylesManager.font19Regular.copyWith(
              color: ColorsManager.c196EB0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(contentPadding ?? 15.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: ColorsManager.cBBBBBB,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: ColorsManager.c196EB0,
                  width: 2,
                ),
              ),
              prefixIcon: prefIcon,
              hintText: hintText,
              hintStyle: TextStylesManager.font19Regular.copyWith(
                color: ColorsManager.cBBBBBB,
              ),
            ),
          );
  }
}
