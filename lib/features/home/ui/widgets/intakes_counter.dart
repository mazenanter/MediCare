import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';

class IntakesCounter extends StatelessWidget {
  const IntakesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      color: ColorsManager.cDDF2FC,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
    );
    return Container(
      width: 240.w,
      height: 240.h,
      decoration: boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/capsula.png',
            height: 50.h,
          ),
          verticalSpace(20),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '0',
                  style: TextStylesManager.font45Bold.copyWith(
                    color: ColorsManager.c9D9D9D,
                  ),
                ),
                TextSpan(
                  text: '/3',
                  style: TextStylesManager.font45Bold.copyWith(
                    color: ColorsManager.c196EB0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
