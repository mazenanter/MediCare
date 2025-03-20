import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/widgets/app_text_button.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_form.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_top_bar.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_styles_manager.dart';

class AddMedScreen extends StatelessWidget {
  const AddMedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddMedTopBar(),
              verticalSpace(30),
              Text(
                'Fill out the fields and hit the Save\nButton to add it!',
                style: TextStylesManager.font20GrayRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    AddMedForm(),
                    verticalSpace(23),
                    AppTextButton(
                      onPressed: () {},
                      text: 'Save',
                      hintStyle: TextStylesManager.font16Bold,
                      buttonWidth: 120,
                      buttonHeight: 34,
                      borderRadius: 8,
                      verticalPadding: 9,
                    ),
                    verticalSpace(30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
