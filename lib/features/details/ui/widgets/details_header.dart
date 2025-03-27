import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/theming/colors_manager.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
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
                      border:
                          Border.all(color: ColorsManager.cEAECF0, width: 2.w),
                      color: ColorsManager.cEFFAFF,
                    ),
                    child: Icon(Icons.info, color: ColorsManager.cFBBC05),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(color: ColorsManager.cEAECF0, width: 2.w),
                      color: ColorsManager.cEFFAFF,
                    ),
                    child: Icon(
                      FontAwesomeIcons.trashCan,
                      color: ColorsManager.cEA4335,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Divider(
              color: ColorsManager.cD8D9E0,
              thickness: 1.5.h,
            ),
          ),
        ],
      ),
    );
  }
}
