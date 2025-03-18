import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/theming/colors_manager.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: ColorsManager.cEAECF0),
                      color: ColorsManager.cFFFFFF,
                    ),
                    child: SvgPicture.asset(
                      fit: BoxFit.none,
                      'assets/svgs/Calendar.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: ColorsManager.cEAECF0),
                      color: ColorsManager.cFFFFFF,
                    ),
                    child: Icon(
                      FontAwesomeIcons.gear,
                      color: ColorsManager.c414042,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: ColorsManager.cEAECF0,
            thickness: 1.5.h,
          ),
        ],
      ),
    );
  }
}
