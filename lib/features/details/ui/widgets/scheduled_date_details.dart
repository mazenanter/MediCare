import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

class ScheduledDateDetails extends StatelessWidget {
  const ScheduledDateDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          color: ColorsManager.c196EB0,
          size: 32.w,
        ),
        horizontalSpace(10),
        Text(
          'Scheduled for 06:13 PM,Wednesday',
          style: TextStylesManager.font18Regular.copyWith(
            color: ColorsManager.c196EB0,
          ),
        ),
      ],
    );
  }
}
