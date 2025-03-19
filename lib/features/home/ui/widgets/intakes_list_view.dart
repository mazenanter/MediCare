import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/home/ui/widgets/intakes_item.dart';

class IntakesListView extends StatelessWidget {
  const IntakesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: IntakesItem(),
        ),
        itemCount: 3,
      ),
    );
  }
}
