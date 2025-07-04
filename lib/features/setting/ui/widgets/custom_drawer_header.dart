import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../data/models/user_model.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: ColorsManager.c196EB0,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: ColorsManager.c8391A1,
            child: Icon(
              FontAwesomeIcons.user,
              size: 40.w,
              color: ColorsManager.c196EB0,
            ),
          ),
          verticalSpace(10),
          Text(
            userModel.name,
            style: TextStylesManager.font20Meduim.copyWith(
              color: ColorsManager.cFFFFFF,
            ),
          ),
          Text(
            userModel.email,
            style: TextStylesManager.font16Meduim.copyWith(
              color: ColorsManager.cF7F8F9,
            ),
          ),
        ],
      ),
    );
  }
}
