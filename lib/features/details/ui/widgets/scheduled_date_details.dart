import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/generated/l10n.dart';

class ScheduledDateDetails extends StatelessWidget {
  const ScheduledDateDetails(
      {super.key, required this.scheduledDate, required this.day});
  final String scheduledDate, day;

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
          '${S.of(context).ScheduledFor} $day $scheduledDate ',
          style: TextStylesManager.font18Regular.copyWith(
            color: ColorsManager.c196EB0,
          ),
        ),
      ],
    );
  }
}
