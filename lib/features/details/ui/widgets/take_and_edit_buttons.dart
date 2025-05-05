import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/widgets/app_text_button.dart';

class TakeAndEditButtons extends StatelessWidget {
  const TakeAndEditButtons(
      {super.key,
      required this.onEdit,
      required this.onTake,
      required this.takeTitle});
  final void Function() onEdit;
  final void Function() onTake;
  final String takeTitle;
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
          text: takeTitle,
          onPressed: onTake,
        ),
        horizontalSpace(35),
        AppTextButton(
          horizontalPadding: 16.w,
          verticalPadding: 12.h,
          buttonWidth: 102.w,
          buttonHeight: 40.h,
          text: S.of(context).Edit,
          onPressed: onEdit,
        ),
      ],
    );
  }
}
