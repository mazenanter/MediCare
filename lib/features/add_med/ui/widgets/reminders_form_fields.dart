import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/add_med/logic/add_med_cubit.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_form_field.dart';

import '../../../../core/theming/text_styles_manager.dart';

class RemindersFormFields extends StatefulWidget {
  const RemindersFormFields({super.key, required this.addMedCubit});
  final AddMedCubit addMedCubit;
  @override
  State<RemindersFormFields> createState() => _RemindersFormFieldsState();
}

class _RemindersFormFieldsState extends State<RemindersFormFields> {
  @override
  Widget build(BuildContext context) {
    const List<String> medicineTypes = [
      'One time',
      'Daily',
      'Every X hours',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 18.h,
      children: [
        Text(
          'Repeat every*',
          style: TextStylesManager.font15Bold,
        ),
        AddMedFormField(
          controller: widget.addMedCubit.repeatTypeController,
          dropdownItems: medicineTypes,
          selectedValue: widget.addMedCubit.selectedRepeatType,
          hintText: 'Select repeat time',
          readOnly: true,
          isDropDown: true,
          onChanged: (value) {
            setState(() {
              widget.addMedCubit.selectedRepeatType = value;
            });
          },
        ),
        if (widget.addMedCubit.selectedRepeatType == 'Every X hours') ...[
          Text(
            'Hours*',
            style: TextStylesManager.font15Bold,
          ),
          AddMedFormField(
            controller: widget.addMedCubit.hoursController,
            hintText: '(e.g. 2 hours)',
          ),
        ],
        if (widget.addMedCubit.selectedRepeatType != 'One time') ...[
          Text(
            'Days*',
            style: TextStylesManager.font15Bold,
          ),
          AddMedFormField(
            controller: widget.addMedCubit.daysController,
            hintText: '(e.g. 2 days)',
          ),
        ],
      ],
    );
  }
}
