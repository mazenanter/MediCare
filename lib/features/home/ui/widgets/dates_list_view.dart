import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/home/ui/widgets/date_item.dart';

class DatesListView extends StatelessWidget {
  const DatesListView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    DateTime firstDayOfWeek =
        today.subtract(Duration(days: today.weekday % 7 + 2));
    List<DateTime> weekDays =
        List.generate(8, (index) => firstDayOfWeek.add(Duration(days: index)));

    return SizedBox(
      height: 64.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        itemBuilder: (context, index) {
          DateTime date = weekDays[index];
          bool isToday = DateUtils.isSameDay(date, today);

          return DateItem(isToday: isToday, date: date);
        },
      ),
    );
  }
}
