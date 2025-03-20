import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/add_med/ui/widgets/date_and_time_dialog.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class DateAndTimePicker extends StatefulWidget {
  const DateAndTimePicker({super.key});

  @override
  State<DateAndTimePicker> createState() => _DateAndTimePickerState();
}

class _DateAndTimePickerState extends State<DateAndTimePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showAddReminderDialog(context);
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
              'dd/mm/yyy , 00:00',
              style: TextStylesManager.font15GrayRegular,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddReminderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DateAndTimeDialog(
          onTapData: () => _selectDate(context),
          onTapTime: () => _selectTime(context),
        );
      },
    );
  }

  DateTime _selectedDate = DateTime.now();

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
