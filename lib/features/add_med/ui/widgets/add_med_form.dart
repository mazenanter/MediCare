import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_form_field.dart';
import 'package:medicare/features/add_med/ui/widgets/date_and_time_picker.dart'
    show DateAndTimePicker;

class AddMedForm extends StatefulWidget {
  const AddMedForm({super.key});

  @override
  State<AddMedForm> createState() => _AddMedFormState();
}

class _AddMedFormState extends State<AddMedForm> {
  String? selectedType;

  final List<String> medicineTypes = [
    'Tablet',
    'Syrup',
    'Injection',
    'Capsule',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name*',
          style: TextStylesManager.font20Meduim,
        ),
        AddMedFormField(
          hintText: 'Name (e.g. Ibuprofen)',
        ),
        Text(
          'Type*',
          style: TextStylesManager.font20Meduim,
        ),
        AddMedFormField(
          dropdownItems: medicineTypes,
          selectedValue: selectedType,
          hintText: 'Type (e.g. Tablet)',
          readOnly: true,
          isDropDown: true,
          onChanged: (value) {
            setState(() {
              selectedType = value;
            });
          },
        ),
        Text(
          'Dose*',
          style: TextStylesManager.font20Meduim,
        ),
        AddMedFormField(
          hintText: 'Dose (e.g. 400mg)',
        ),
        Text(
          'Amount*',
          style: TextStylesManager.font20Meduim,
        ),
        AddMedFormField(
          hintText: 'Amount (e.g. 2)',
        ),
        Text(
          'Reminder',
          style: TextStylesManager.font20Meduim,
        ),
        Text(
          'Date',
          style: TextStylesManager.font15Bold,
        ),
        DateAndTimePicker(),
      ],
    );
  }
}
