import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medicare/features/details/ui/widgets/drop_and_dose_text.dart';
import 'package:medicare/features/details/ui/widgets/repeat_info.dart';
import 'package:medicare/features/details/ui/widgets/scheduled_date_details.dart';
import 'package:medicare/features/home/data/models/medication_response_model.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles_manager.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    super.key,
    required this.medicationResponseModel,
  });
  final MedicationResponseModel medicationResponseModel;
  @override
  Widget build(BuildContext context) {
    String timeOnly =
        DateFormat('hh:mm a').format(medicationResponseModel.dateTime.toDate());
    String day =
        DateFormat.EEEE().format(medicationResponseModel.dateTime.toDate());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        children: [
          Text(
            S.of(context).DidYouTakeYourMedicine,
            style: TextStylesManager.font25Meduim,
          ),
          Image.asset(
            'assets/images/details_capsula.png',
            width: 118.32.w,
          ),
          Text(
            medicationResponseModel.name,
            style: TextStylesManager.font47Bold,
          ),
          verticalSpace(21),
          ScheduledDateDetails(
            day: day,
            scheduledDate: timeOnly,
          ),
          if (medicationResponseModel.intervalHours != null ||
              medicationResponseModel.intervalHours == 0) ...[
            verticalSpace(35),
            RepeatAndDaysInfo(
              repeat: medicationResponseModel.intervalHours.toString(),
              days: medicationResponseModel.durationDays.toString(),
            ),
          ],
          verticalSpace(35),
          DropAndDoseText(
            drop: medicationResponseModel.amount.toString(),
            dose: medicationResponseModel.dose,
            type: medicationResponseModel.type,
          ),
        ],
      ),
    );
  }
}
