import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';

class IntakesItem extends StatefulWidget {
  const IntakesItem({super.key, required this.medication});
  final MedicationResponseModel medication;

  @override
  State<IntakesItem> createState() => _IntakesItemState();
}

class _IntakesItemState extends State<IntakesItem> {
  @override
  Widget build(BuildContext context) {
    String timeOnly =
        DateFormat('hh:mm a').format(widget.medication.dateTime.toDate());
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: ColorsManager.cEAECF0),
        ),
        child: ListTile(
          leading: Icon(
            Icons.info,
            color: ColorsManager.cFBBC05,
          ),
          title: Text(
            widget.medication.name,
            style: TextStylesManager.font16Bold,
          ),
          subtitle: Text(
            '${widget.medication.amount} ${widget.medication.type}, ${widget.medication.dose}',
            style: TextStylesManager.font12Regular,
          ),
          trailing: Container(
            margin: EdgeInsets.all(8.w),
            width: 75.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: ColorsManager.c196EB0,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: Text(
                timeOnly,
                style: TextStylesManager.font16Bold.copyWith(
                  color: ColorsManager.cFFFFFF,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
