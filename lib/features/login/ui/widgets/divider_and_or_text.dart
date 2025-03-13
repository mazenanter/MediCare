import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';

class DividerAndOrText extends StatelessWidget {
  const DividerAndOrText({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1,
          width: 112.w,
          color: ColorsManager.cB8B8B8,
        ),
        Text('Or'),
        Container(
          height: 1,
          width: 112.w,
          color: ColorsManager.cB8B8B8,
        ),
      ],
    );
  }
}
