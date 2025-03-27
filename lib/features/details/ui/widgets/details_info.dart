import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/details/ui/widgets/details_header.dart';
import 'package:medicare/features/details/ui/widgets/drop_and_dose_text.dart';
import 'package:medicare/features/details/ui/widgets/scheduled_date_details.dart';
import 'package:medicare/features/details/ui/widgets/take_and_edit_buttons.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles_manager.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        children: [
          DetailsHeader(),
          verticalSpace(27),
          Text(
            S.of(context).DidYouTakeYourMedicine,
            style: TextStylesManager.font25Meduim,
          ),
          Image.asset(
            'assets/images/details_capsula.png',
            width: 118.32.w,
          ),
          Text(
            'B12 Drops',
            style: TextStylesManager.font47Bold,
          ),
          verticalSpace(21),
          ScheduledDateDetails(),
          verticalSpace(45),
          DropAndDoseText(),
          verticalSpace(45),
          TakeAndEditButtons(),
          verticalSpace(55),
        ],
      ),
    );
  }
}
