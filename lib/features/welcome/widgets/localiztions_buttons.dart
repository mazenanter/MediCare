import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/features/welcome/widgets/change_language_dialog.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/localization/locale_cubit.dart';
import '../../../core/theming/text_styles_manager.dart';

class LocalizationToogleButtons extends StatelessWidget {
  const LocalizationToogleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCubit = context.watch<LocaleCubit>();
    final isArabic = localeCubit.isArabic;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ChangeLanguageDialog(
                    localeCubit: localeCubit,
                  );
                },
              );
            },
            child: Row(
              children: [
                Text(
                  isArabic ? 'AR' : 'EN',
                  style: TextStylesManager.font29Bold,
                ),
                horizontalSpace(10),
                SvgPicture.asset(
                  isArabic ? 'assets/svgs/EG.svg' : 'assets/svgs/us.svg',
                  width: 40.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
