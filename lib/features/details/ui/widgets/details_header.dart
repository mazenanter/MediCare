import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/widgets/custom_alert_dialog.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';
import '../../../../generated/l10n.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader(
      {super.key, required this.onDelete, required this.isTaken});
  final void Function() onDelete;
  final int isTaken;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(color: ColorsManager.cEAECF0, width: 2.w),
                      color: ColorsManager.cEFFAFF,
                    ),
                    child: Icon(
                        isTaken == 0
                            ? Icons.info
                            : FontAwesomeIcons.circleCheck,
                        color: isTaken == 0
                            ? ColorsManager.cFBBC05
                            : ColorsManager.c34A853),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          title: S.of(context).DeleteMedication,
                          content: S
                              .of(context)
                              .AreYouSureYouWantToDeleteThisMedication,
                          icon: Icon(
                            FontAwesomeIcons.trashCan,
                            color: ColorsManager.cEA4335,
                          ),
                          actions: [
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all(
                                    ColorsManager.c196EB0),
                              ),
                              child: Text(
                                S.of(context).Cancel,
                                style: TextStylesManager.font20Meduim,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => context.pop(),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all(
                                    ColorsManager.cEA4335),
                              ),
                              onPressed: onDelete,
                              child: Text(
                                S.of(context).Delete,
                                style: TextStylesManager.font20Meduim,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(color: ColorsManager.cEAECF0, width: 2.w),
                      color: ColorsManager.cEFFAFF,
                    ),
                    child: Icon(
                      FontAwesomeIcons.trashCan,
                      color: ColorsManager.cEA4335,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Divider(
              color: ColorsManager.cD8D9E0,
              thickness: 1.5.h,
            ),
          ),
        ],
      ),
    );
  }
}
