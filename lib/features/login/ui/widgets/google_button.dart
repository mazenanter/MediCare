import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(
          double.maxFinite,
          56.36.h,
        )),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 14.h,
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(ColorsManager.cFFFFFF),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: ColorsManager.c414042),
          ),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.google, color: ColorsManager.c414042),
          horizontalSpace(6),
          Text(
            S.of(context).ContinueWithGoogle,
            style: TextStylesManager.font19Regular.copyWith(
              color: ColorsManager.c414042,
            ),
          ),
        ],
      ),
    );
  }
}
