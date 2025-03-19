import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/features/home/ui/widgets/dates_list_view.dart';
import 'package:medicare/features/home/ui/widgets/fab_button.dart';
import 'package:medicare/features/home/ui/widgets/home_top_bar.dart';
import 'package:medicare/features/home/ui/widgets/intakes_counter.dart';
import 'package:medicare/features/home/ui/widgets/intakes_list_view.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/text_styles_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTopBar(),
                  verticalSpace(30),
                  Text(
                    'Today',
                    style: TextStylesManager.font29Bold.copyWith(
                      color: ColorsManager.c196EB0,
                    ),
                  ),
                ],
              ),
            ),
            DatesListView(),
            verticalSpace(45),
            Text(
              'Intakes',
              style: TextStylesManager.font29Bold.copyWith(
                color: ColorsManager.c196EB0,
              ),
            ),
            verticalSpace(45),
            IntakesCounter(),
            verticalSpace(40),
            IntakesListView(),
          ],
        ),
      ),
      floatingActionButton: FabButton(),
    );
  }
}
