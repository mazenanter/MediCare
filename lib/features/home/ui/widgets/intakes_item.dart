import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

class IntakesItem extends StatelessWidget {
  const IntakesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: ColorsManager.cEAECF0),
        ),
        child: ListTile(
          leading: Icon(
            Icons.info,
            color: ColorsManager.cFBBC05,
          ),
          title: Text(
            'Vitamin D',
            style: TextStylesManager.font16Bold,
          ),
          subtitle: Text(
            '1 Capsule, 1000mg',
            style: TextStylesManager.font12Regular,
          ),
          trailing: Container(
            margin: EdgeInsets.all(8.w),
            width: 64.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: ColorsManager.c196EB0,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: Text(
                '09:41',
                style: TextStylesManager.font16Bold.copyWith(
                  color: ColorsManager.cFFFFFF,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
