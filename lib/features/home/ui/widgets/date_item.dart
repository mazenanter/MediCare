import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class DateItem extends StatelessWidget {
  const DateItem({
    super.key,
    required this.isToday,
    required this.date,
  });

  final bool isToday;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("Selected Date: ${date.toString()}");
      },
      child: Container(
        width: 48.w,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: ColorsManager.cFFFFFF,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              width: 2.w,
              color: isToday ? ColorsManager.c196EB0 : ColorsManager.cEAECF0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.d().format(date),
              style: TextStylesManager.font20Meduim.copyWith(
                color: ColorsManager.c040415,
              ),
            ),
            Text(
              DateFormat.E().format(date),
              style: TextStylesManager.font12Bold.copyWith(
                color: isToday ? ColorsManager.c196EB0 : ColorsManager.cCDCDD0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
