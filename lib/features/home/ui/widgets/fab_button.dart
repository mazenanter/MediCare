import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/extenstions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';

class FabButton extends StatelessWidget {
  const FabButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 49.w,
      height: 50.h,
      child: FloatingActionButton(
        splashColor: Colors.white,
        elevation: 6,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        backgroundColor: ColorsManager.c196EB0,
        onPressed: () {
          context.pushNamed(Routes.addMedScreen);
        },
        child: Icon(
          FontAwesomeIcons.plus,
          color: ColorsManager.cFFFFFF,
        ),
      ),
    );
  }
}
