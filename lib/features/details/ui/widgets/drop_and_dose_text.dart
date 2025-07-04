import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class DropAndDoseText extends StatelessWidget {
  const DropAndDoseText(
      {super.key, required this.drop, required this.dose, required this.type});
  final String drop, dose, type;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.fileLines,
          color: ColorsManager.c196EB0,
          size: 32.w,
        ),
        horizontalSpace(10),
        Text(
          '$drop $type, $dose',
          style: TextStylesManager.font18Regular.copyWith(
            color: ColorsManager.c196EB0,
          ),
        ),
      ],
    );
  }
}
