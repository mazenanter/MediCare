import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_form_field.dart';
import 'package:medicare/features/add_med/ui/widgets/date_and_time/date_and_time_picker.dart';
import 'package:medicare/features/add_med/ui/widgets/reminders_form_fields.dart';
import 'package:medicare/generated/l10n.dart';

import '../../logic/add_med_cubit.dart';

class AddMedForm extends StatefulWidget {
  const AddMedForm({super.key});

  @override
  State<AddMedForm> createState() => _AddMedFormState();
}

class _AddMedFormState extends State<AddMedForm> {
  @override
  Widget build(BuildContext context) {
    final List<String> medicineTypes = [
      S.of(context).Tablet,
      S.of(context).Drop,
      S.of(context).Injection,
      S.of(context).Capsule,
    ];
    return Column(
      spacing: 18.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).Name,
          style: TextStylesManager.font20Meduim,
        ),
        AddMedFormField(
          controller: context.read<AddMedCubit>().nameController,
          hintText: S.of(context).NameEG,
        ),
        Text(
          S.of(context).Type,
          style: TextStylesManager.font20Meduim,
        ),
        AddMedFormField(
          controller: TextEditingController(),
          dropdownItems: medicineTypes,
          selectedValue: context.read<AddMedCubit>().selectedType,
          hintText: S.of(context).TypeEG,
          readOnly: true,
          isDropDown: true,
          onChanged: (value) {
            setState(() {
              context.read<AddMedCubit>().selectedType = value;
            });
          },
        ),
        Text(
          S.of(context).Dose,
          style: TextStylesManager.font20Meduim,
        ),
        AddMedFormField(
          controller: context.read<AddMedCubit>().doseController,
          hintText: S.of(context).DoseEG,
        ),
        Text(
          S.of(context).Amount,
          style: TextStylesManager.font20Meduim,
        ),
        AddMedFormField(
          controller: context.read<AddMedCubit>().amountController,
          hintText: S.of(context).AmountEG,
        ),
        Text(
          S.of(context).Reminders,
          style: TextStylesManager.font20Meduim,
        ),
        RemindersFormFields(
          addMedCubit: context.read<AddMedCubit>(),
        ),
        Text(
          S.of(context).FirstDate,
          style: TextStylesManager.font15Bold,
        ),
        DateAndTimePicker(),
      ],
    );
  }
}
