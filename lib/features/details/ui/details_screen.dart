import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/routing/routes.dart';
import 'package:medicare/features/details/ui/widgets/details_bloc_listener.dart';
import 'package:medicare/features/details/ui/widgets/details_header.dart';
import 'package:medicare/features/details/ui/widgets/details_info.dart';
import 'package:medicare/features/details/ui/widgets/take_and_edit_buttons.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';

import '../../../core/theming/colors_manager.dart';
import '../../../core/widgets/back_arrow_button.dart';
import '../../../generated/l10n.dart';
import '../logic/details_cubit.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.medicationResponseModel});
  final MedicationResponseModel medicationResponseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 45.h, left: 20.w, right: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BackArrowButton(),
                verticalSpace(40),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsManager.cDDF2FC,
                    borderRadius: BorderRadius.circular(41.r),
                    border: Border.all(
                      color: ColorsManager.cD8D9E0,
                      width: 1.75.w,
                    ),
                  ),
                  child: Column(
                    children: [
                      DetailsHeader(
                        isTaken: medicationResponseModel.isTaken,
                        onDelete: () {
                          context
                              .read<DetailsCubit>()
                              .deleteMedication(medicationResponseModel.id);
                        },
                      ),
                      verticalSpace(27),
                      DetailsInfo(
                        medicationResponseModel: medicationResponseModel,
                      ),
                      verticalSpace(35),
                      TakeAndEditButtons(
                        takeTitle: medicationResponseModel.isTaken == 0
                            ? S.of(context).Take
                            : 'UnTake',
                        onTake: () {
                          context.read<DetailsCubit>().updateTakeMedication(
                                context: context,
                                medicationId: medicationResponseModel.id,
                                isTaken: medicationResponseModel.isTaken == 0
                                    ? 1
                                    : 0,
                              );
                          log('${medicationResponseModel.isTaken}');
                        },
                        onEdit: () {
                          context.pushNamed(
                            Routes.addMedScreen,
                            arguments: medicationResponseModel,
                          );
                        },
                      ),
                      verticalSpace(55),
                    ],
                  ),
                ),
                verticalSpace(60),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: DetailsBlocListener(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
