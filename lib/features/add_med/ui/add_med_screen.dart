import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/widgets/app_text_button.dart';
import 'package:medicare/features/add_med/logic/add_med_cubit.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_bloc_listener.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_form.dart';
import 'package:medicare/features/add_med/ui/widgets/add_med_top_bar.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_styles_manager.dart';
import '../../../generated/l10n.dart';

class AddMedScreen extends StatelessWidget {
  const AddMedScreen({super.key, this.medicationResponseModel});
  final MedicationResponseModel? medicationResponseModel;
  @override
  Widget build(BuildContext context) {
    // Initialize the AddMedCubit and pass the medicationResponseModel if available
    final addMedCubit = context.read<AddMedCubit>();
    if (medicationResponseModel != null) {
      addMedCubit.init(medicationResponseModel!);
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddMedTopBar(
                title: medicationResponseModel != null
                    ? '${S.of(context).Edit} ${medicationResponseModel!.name}'
                    : S.of(context).AddNewMedicine,
              ),
              verticalSpace(30),
              Text(
                S.of(context).FillOutTheFields,
                style: TextStylesManager.font20GrayRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    AddMedForm(),
                    verticalSpace(23),
                    AppTextButton(
                      onPressed: () {
                        context.read<AddMedCubit>().addMedication(context);
                      },
                      text: S.of(context).Save,
                      hintStyle: TextStylesManager.font16Bold,
                      buttonWidth: 120,
                      buttonHeight: 34,
                      borderRadius: 8,
                      verticalPadding: 9,
                    ),
                    verticalSpace(30),
                  ],
                ),
              ),
              AddMedBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
