import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

import '../../../../core/localization/locale_cubit.dart';
import '../../../welcome/widgets/change_language_dialog.dart';

class LanguagesToggle extends StatelessWidget {
  const LanguagesToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCubit = context.watch<LocaleCubit>();
    final isArabic = localeCubit.isArabic;
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.language,
        ),
        horizontalSpace(16),
        Text(
          isArabic ? 'اللغه' : 'Language',
          style: TextStylesManager.font20Meduim,
        ),
        Spacer(),
        Container(
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: GestureDetector(
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
            child: Text(
              isArabic ? 'AR' : 'EN',
              textAlign: TextAlign.center,
              style: TextStylesManager.font20Meduim,
            ),
          ),
        ),
      ],
    );
  }
}
