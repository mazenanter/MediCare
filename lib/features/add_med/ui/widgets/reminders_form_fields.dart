import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/add_med/logic/add_med_cubit.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_form_field.dart';

import '../../../../core/theming/text_styles_manager.dart';
import '../../../../generated/l10n.dart';

class RemindersFormFields extends StatefulWidget {
  const RemindersFormFields({super.key, required this.addMedCubit});
  final AddMedCubit addMedCubit;
  @override
  State<RemindersFormFields> createState() => _RemindersFormFieldsState();
}

class _RemindersFormFieldsState extends State<RemindersFormFields> {
  @override
  Widget build(BuildContext context) {
    List<String> medicineTypes = [
      S.of(context).OneTime,
      S.of(context).Daily,
      S.of(context).EveryXHours,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 18.h,
      children: [
        Text(
          S.of(context).RepeatEvery,
          style: TextStylesManager.font15Bold,
        ),
        AddMedFormField(
          controller: widget.addMedCubit.repeatTypeController,
          dropdownItems: medicineTypes,
          selectedValue: widget.addMedCubit.selectedRepeatType,
          hintText: S.of(context).SelectRepeatTime,
          readOnly: true,
          isDropDown: true,
          onChanged: (value) {
            setState(() {
              widget.addMedCubit.selectedRepeatType = value;
            });
          },
        ),
        if (widget.addMedCubit.selectedRepeatType ==
            S.of(context).EveryXHours) ...[
          Text(
            S.of(context).Hours,
            style: TextStylesManager.font15Bold,
          ),
          AddMedFormField(
            controller: widget.addMedCubit.hoursController,
            hintText: S.of(context).EG2Hours,
          ),
        ],
        if (widget.addMedCubit.selectedRepeatType != S.of(context).OneTime) ...[
          Text(
            S.of(context).Days,
            style: TextStylesManager.font15Bold,
          ),
          AddMedFormField(
            controller: widget.addMedCubit.daysController,
            hintText: S.of(context).EG2Days,
          ),
        ],
      ],
    );
  }
}
