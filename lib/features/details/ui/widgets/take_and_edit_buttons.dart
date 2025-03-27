import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';

import '../../../../core/widgets/app_text_button.dart';

class TakeAndEditButtons extends StatelessWidget {
  const TakeAndEditButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextButton(
          horizontalPadding: 16.w,
          verticalPadding: 12.h,
          buttonWidth: 102.w,
          buttonHeight: 40.h,
          text: 'Take',
          onPressed: () {},
        ),
        horizontalSpace(35),
        AppTextButton(
          horizontalPadding: 16.w,
          verticalPadding: 12.h,
          buttonWidth: 102.w,
          buttonHeight: 40.h,
          text: 'Edit',
          onPressed: () {},
        ),
      ],
    );
  }
}
