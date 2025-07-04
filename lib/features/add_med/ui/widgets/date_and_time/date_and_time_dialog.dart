import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/features/add_med/ui/widgets/date_and_time/date_and_time_container.dart';
import 'package:medicare/features/add_med/ui/widgets/date_and_time/date_and_time_dialog_button.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/text_styles_manager.dart';
import '../../../../../generated/l10n.dart';
import '../../../logic/add_med_cubit.dart';

class DateAndTimeDialog extends StatelessWidget {
  const DateAndTimeDialog({super.key, required this.addMedCubit});
  final AddMedCubit addMedCubit;
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
              S.of(context).AddReminder,
              style: TextStylesManager.font24Bold,
            ),
            verticalSpace(20),
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: addMedCubit.selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != addMedCubit.selectedDate) {
                  addMedCubit.updateSelectedDate(picked);
                }
              },
              child: DateAndTimeContainer(
                text: DateFormat('dd/MM/yyyy')
                    .format(addMedCubit.selectedDate)
                    .toString(),
                icon: Icons.calendar_month_outlined,
              ),
            ),
            verticalSpace(16),
            GestureDetector(
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: addMedCubit.selectedTime,
                );
                if (picked != null && picked != addMedCubit.selectedTime) {
                  addMedCubit.updateSelectedTime(picked);
                }
              },
              child: DateAndTimeContainer(
                text: addMedCubit.selectedTime.format(context).toString(),
                icon: Icons.access_time_outlined,
              ),
            ),
            verticalSpace(20),
            DateAndTimeDialogButtons(
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
