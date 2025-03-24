import 'package:flutter/material.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/helpers/spacing.dart';
import 'package:medicare/features/add_med/ui/widgets/custom_dialog_button.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/theming/colors_manager.dart';

class DateAndTimeDialogButtons extends StatelessWidget {
  const DateAndTimeDialogButtons({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDialogButton(
          onPressed: () => context.pop(),
          text: S.of(context).Cancel,
          buttonColor: ColorsManager.cFFFFFF,
          textColor: ColorsManager.cEA4335,
        ),
        horizontalSpace(16),
        CustomDialogButton(
          onPressed: onPressed,
          text: S.of(context).Add,
        ),
      ],
    );
  }
}
