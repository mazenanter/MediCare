import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/features/details/ui/widgets/details_info.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';

import '../../../core/theming/colors_manager.dart';
import '../../../core/widgets/back_arrow_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.medicationResponseModel});
  final MedicationResponseModel medicationResponseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 45.h, left: 20.w, right: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BackArrowButton(),
                verticalSpace(40),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsManager.cDDF2FC,
                    borderRadius: BorderRadius.circular(41.r),
                    border: Border.all(
                      color: ColorsManager.cD8D9E0,
                      width: 1.75.w,
                    ),
                  ),
                  child: DetailsInfo(
                    medicationResponseModel: medicationResponseModel,
                  ),
                ),
                verticalSpace(60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
