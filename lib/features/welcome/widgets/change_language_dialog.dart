import 'package:flutter/material.dart';
import 'package:medicare/core/helpers/extenstions.dart';

import '../../../core/localization/locale_cubit.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/text_styles_manager.dart';
import '../../../generated/l10n.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({
    super.key,
    required this.localeCubit,
  });
  final LocaleCubit localeCubit;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).ChangeLanguage,
        style: TextStylesManager.font20Meduim,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(ColorsManager.cEA4335),
          ),
          onPressed: () => context.pop(),
          child: Text(
            S.of(context).Cancel,
            style: TextStylesManager.font20Meduim,
          ),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(ColorsManager.c196EB0),
          ),
          onPressed: () {
            localeCubit.toggleLanguage();
            context.pop();
          },
          child: Text(
            S.of(context).Ok,
            style: TextStylesManager.font20Meduim,
          ),
        ),
      ],
      content: Text(
        S.of(context).SureToChangeLanguage,
        style: TextStylesManager.font16Bold,
      ),
    );
  }
}
