import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class AddMedButton extends StatelessWidget {
  const AddMedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: ColorsManager.cFBBC05,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        fixedSize: Size(269.w, 68.h),
      ),
      onPressed: () {},
      child: Text(
        'Add medicine',
        style: TextStylesManager.font29Bold.copyWith(
          color: ColorsManager.cFFFFFF,
        ),
      ),
    );
  }
}
