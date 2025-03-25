import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medicare/features/add_med/logic/add_med_cubit.dart';
import 'package:medicare/features/add_med/logic/add_med_state.dart';
import 'package:medicare/features/add_med/ui/widgets/date_and_time/date_and_time_dialog.dart';

import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/text_styles_manager.dart';

class DateAndTimePicker extends StatelessWidget {
  const DateAndTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMedCubit, AddMedState>(
      buildWhen: (previous, current) => current is Update,
      builder: (context, state) {
        final cubit = context.read<AddMedCubit>();
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return DateAndTimeDialog(
                  addMedCubit: cubit,
                );
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
            height: 42.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.cFFFFFF,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: ColorsManager.cBBBBBB,
                width: 1.5,
              ),
            ),
            child: Row(
              spacing: 8.w,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: ColorsManager.cBBBBBB,
                ),
                Text(
                  '${DateFormat('d/MM/yyyy').format(cubit.selectedDate)}, ${cubit.selectedTime.format(context)}',
                  style: TextStylesManager.font15Bold.copyWith(
                    color: ColorsManager.c196EB0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
