import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class RepeatAndDaysInfo extends StatelessWidget {
  const RepeatAndDaysInfo(
      {super.key, required this.repeat, required this.days});
  final String repeat;
  final String days;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.repeat,
          color: ColorsManager.c196EB0,
          size: 32.w,
        ),
        horizontalSpace(10),
        Text(
          '$repeat ${S.of(context).HoursFor} $days ${S.of(context).Days}',
          style: TextStylesManager.font18Regular.copyWith(
            color: ColorsManager.c196EB0,
          ),
        ),
      ],
    );
  }
}
