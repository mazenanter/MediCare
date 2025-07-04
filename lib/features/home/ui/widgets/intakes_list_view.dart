import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/routing/routes.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';
import 'package:medicare/features/home/ui/widgets/intakes_item.dart';

class IntakesListView extends StatelessWidget {
  const IntakesListView({super.key, required this.medications});
  final List<MedicationResponseModel> medications;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(Routes.detailsScreen,
                  arguments: medications[index]);
            },
            child: IntakesItem(
              medication: medications[index],
            ),
          ),
        ),
        itemCount: medications.length,
      ),
    );
  }
}
