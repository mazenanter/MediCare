import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/theming/text_styles_manager.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          size: 24,
        ),
        horizontalSpace(16),
        Text(
          S.of(context).About,
          style: TextStylesManager.font20Meduim,
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              showAboutBottomSheet(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Text(
                S.of(context).View,
                style: TextStylesManager.font20Meduim,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> showAboutBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).AboutTheApp,
                      style: TextStylesManager.font16Bold,
                    ),
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.close,
                        color: ColorsManager.cEA4335,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),
                Row(
                  spacing: 10.w,
                  children: [
                    Icon(
                      FontAwesomeIcons.heart,
                    ),
                    Text(
                      S.of(context).OurMission,
                      style: TextStylesManager.font20Bold,
                    ),
                  ],
                ),
                verticalSpace(10),
                Text(
                  S
                      .of(context)
                      .Westrivetoimprovemedicationadherenceandenhancehealthoutcomesbyprovidingeasytousetoolsformedicationmanagement,
                  style: TextStylesManager.font16Meduim,
                ),
                verticalSpace(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 15.w,
                      children: [
                        Icon(
                          FontAwesomeIcons.cogs,
                        ),
                        Text(
                          S.of(context).KeyFeatures,
                          style: TextStylesManager.font20Bold,
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Text(
                      S
                          .of(context)
                          .MedicationReminders2DrugInformation3HealthTracking4UserFriendlyInterface,
                      style: TextStylesManager.font16Meduim,
                    ),
                  ],
                ),
                verticalSpace(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 15.w,
                      children: [
                        Icon(
                          FontAwesomeIcons.graduationCap,
                        ),
                        Text(
                          S.of(context).VersionInformation,
                          style: TextStylesManager.font20Bold,
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Text(
                      '${S.of(context).VersionReleaseDateJuneDevelopedby} Mazen Anter',
                      style: TextStylesManager.font16Meduim,
                    ),
                  ],
                ),
                verticalSpace(10),
              ],
            ),
          ),
        );
      },
    );
  }
}
