import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/core/widgets/back_arrow_button.dart';
import 'package:medicare/generated/l10n.dart';

class AddMedTopBar extends StatelessWidget {
  const AddMedTopBar({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 33.h),
      child: Row(
        children: [
          BackArrowButton(
            buttonWidth: 48.w,
            buttonHeight: 48.h,
          ),
          horizontalSpace(16),
          Text(
            title ?? S.of(context).AddNewMedicine,
            style: TextStylesManager.font24Bold,
          ),
        ],
      ),
    );
  }
}
