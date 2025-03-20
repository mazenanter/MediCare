import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/features/add_med/ui/widgets/custom_dialog_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class DateAndTimeDialog extends StatelessWidget {
  const DateAndTimeDialog({
    super.key,
    required this.onTapData,
    required this.onTapTime,
  });
  final Function() onTapData;
  final Function() onTapTime;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorsManager.cFFFFFF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      elevation: 8.0,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Reminder",
              style: TextStylesManager.font24Bold,
            ),
            verticalSpace(20),
            GestureDetector(
              onTap: onTapData,
              child: customContainer(
                text: "DD/MM/YYYY",
                icon: Icons.calendar_month_outlined,
              ),
            ),
            verticalSpace(16),
            GestureDetector(
              onTap: onTapTime,
              child: customContainer(
                text: "12:00 PM",
                icon: Icons.access_time_outlined,
              ),
            ),
            verticalSpace(20),
            dialogButtons(context),
          ],
        ),
      ),
    );
  }

  Row dialogButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDialogButton(
          onPressed: () => context.pop(),
          text: 'Cancel',
          buttonColor: ColorsManager.cFFFFFF,
          textColor: ColorsManager.cEA4335,
        ),
        horizontalSpace(16),
        CustomDialogButton(
          onPressed: () {},
          text: 'Add',
        ),
      ],
    );
  }

  Container customContainer({required String text, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStylesManager.font18Regular,
          ),
          Icon(icon, size: 20, color: Color(0xFF666666)),
        ],
      ),
    );
  }
}
