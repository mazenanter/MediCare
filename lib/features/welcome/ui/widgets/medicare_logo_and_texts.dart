import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

import '../../../../generated/l10n.dart';

class MediCareLogoAndTexts extends StatelessWidget {
  const MediCareLogoAndTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/medi_care_logo.png',
          width: 205.w,
          height: 205.h,
        ),
        verticalSpace(58),
        Text(
          S.of(context).WelcomeTo,
          style: TextStylesManager.font34Bold,
        ),
        Text(
          S.of(context).MediCare,
          style: TextStylesManager.font60MainColorBold,
        ),
        verticalSpace(30),
        Text(
          S
              .of(context)
              .YourPersonalAssistantForMmanagingYourMmedicationSchedule,
          textAlign: TextAlign.center,
          style: TextStylesManager.font20MainColorRegular,
        ),
      ],
    );
  }
}
