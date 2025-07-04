import 'package:flutter/material.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';

class CustomAlertDialog extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String content;
  final List<Widget> actions;

  const CustomAlertDialog({
    super.key,
    this.icon,
    this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      icon: icon,
      title: title != null
          ? Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStylesManager.font16Bold,
            )
          : null,
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStylesManager.font20Meduim,
      ),
      actions: actions,
    );
  }
}
