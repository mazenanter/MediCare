import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/theming/colors_manager.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton(
      {super.key, this.arrowPadding, this.buttonWidth, this.buttonHeight});
  final double? arrowPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;
    return Align(
      alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: (arrowPadding ?? 26.w),
        ),
        child: Container(
          width: buttonWidth ?? 41.w,
          height: buttonHeight ?? 41.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorsManager.cE8ECF4),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 19,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ),
      ),
    );
  }
}
