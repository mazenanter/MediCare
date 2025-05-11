import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/theming/colors_manager.dart';
import 'package:medicare/generated/l10n.dart';

import '../../../../core/theming/text_styles_manager.dart';

class NotificationToggle extends StatelessWidget {
  const NotificationToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.bell,
        ),
        SizedBox(width: 16),
        Text(
          S.of(context).Notifications,
          style: TextStylesManager.font20Meduim,
        ),
        Spacer(),
        Switch(
          activeColor: ColorsManager.c196EB0,
          value: true, // Replace with your notification state
          onChanged: (value) {
            // Handle notification toggle change
          },
        ),
      ],
    );
  }
}
