import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.contact_mail_outlined,
          size: 24,
        ),
        SizedBox(width: 16),
        Text(
          S.of(context).ContactUs,
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
              bottomSheet(context);
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

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).ContactUs,
                    style: TextStylesManager.font16Bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: ColorsManager.cEA4335,
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                spacing: 10.w,
                children: [
                  Icon(
                    Icons.email_outlined,
                  ),
                  Text(
                    S.of(context).Email,
                    style: TextStylesManager.font20Bold,
                  ),
                ],
              ),
              verticalSpace(10),
              Text(
                'medic8204@gmail.com',
                style: TextStylesManager.font20Meduim,
              ),
              verticalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 15.w,
                    children: [
                      Icon(
                        FontAwesomeIcons.phone,
                      ),
                      Text(
                        S.of(context).Phone,
                        style: TextStylesManager.font20Bold,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Text(
                    '+201093099479',
                    style: TextStylesManager.font20Meduim,
                  ),
                ],
              ),
              verticalSpace(10),
            ],
          ),
        );
      },
    );
  }
}
