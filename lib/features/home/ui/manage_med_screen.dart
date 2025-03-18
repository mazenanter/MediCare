import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/features/home/ui/widgets/add_med_button.dart';
import 'package:medicare/features/home/ui/widgets/home_top_bar.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';

class ManageMedScreen extends StatelessWidget {
  const ManageMedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              HomeTopBar(),
              verticalSpace(60),
              Image.asset(
                'assets/images/reminder_12570772.png',
                width: 242.w,
                height: 235.h,
              ),
              verticalSpace(60),
              Text(
                'Manage your meds',
                style: TextStylesManager.font29Bold.copyWith(
                  color: ColorsManager.c196EB0,
                ),
              ),
              verticalSpace(90),
              Text(
                'Add your meds to be reminded on\ntime and track your health ',
                textAlign: TextAlign.center,
                style: TextStylesManager.font18Regular.copyWith(
                  color: ColorsManager.cB8B8B8,
                ),
              ),
              Spacer(),
              AddMedButton(),
              verticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
