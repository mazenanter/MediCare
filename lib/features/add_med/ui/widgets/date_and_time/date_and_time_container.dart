import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles_manager.dart';

class DateAndTimeContainer extends StatelessWidget {
  const DateAndTimeContainer(
      {super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              overflow: TextOverflow.ellipsis,
              text,
              style: TextStylesManager.font18Regular,
              maxLines: 1,
            ),
          ),
          Icon(icon, size: 20, color: Color(0xFF666666)),
        ],
      ),
    );
  }
}
