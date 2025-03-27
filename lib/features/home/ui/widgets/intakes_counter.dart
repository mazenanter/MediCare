import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/features/home/logic/home_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';

class IntakesCounter extends StatelessWidget {
  const IntakesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final intakes = context.read<HomeCubit>().getIntakesMedication();
    final allMedications = context.read<HomeCubit>().medicationsList.length;
    BoxDecoration boxDecoration = BoxDecoration(
      color: ColorsManager.cDDF2FC,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
    );
    return SizedBox(
      width: 240.w,
      height: 240.h,
      child: CircularPercentIndicator(
        radius: 117.r,
        lineWidth: 15.r,
        percent: intakes / allMedications,
        progressColor: intakes == allMedications
            ? ColorsManager.c34A853
            : ColorsManager.c196EB0,
        animation: true,
        animationDuration: 1200,
        center: Container(
          width: 200.w,
          height: 200.h,
          decoration: boxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/capsula.png',
                height: 50.h,
              ),
              verticalSpace(20),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${context.read<HomeCubit>().getIntakesMedication()}',
                      style: TextStylesManager.font45Bold.copyWith(
                        color: intakes == allMedications
                            ? ColorsManager.c34A853
                            : ColorsManager.c9D9D9D,
                      ),
                    ),
                    TextSpan(
                      text:
                          '/${context.read<HomeCubit>().medicationsList.length}',
                      style: TextStylesManager.font45Bold.copyWith(
                        color: intakes == allMedications
                            ? ColorsManager.c34A853
                            : ColorsManager.c196EB0,
                      ),
                    ),
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
