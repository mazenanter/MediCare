import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/features/home/logic/home_cubit.dart';
import 'package:medicare/features/home/logic/home_state.dart';
import 'package:medicare/features/home/ui/manage_med_screen.dart';
import 'package:medicare/features/home/ui/widgets/dates_list_view.dart';
import 'package:medicare/features/home/ui/widgets/fab_button.dart';
import 'package:medicare/features/home/ui/widgets/home_top_bar.dart';
import 'package:medicare/features/home/ui/widgets/intake_item_shimmer_loading.dart';
import 'package:medicare/features/home/ui/widgets/intakes_bloc_builder.dart';
import 'package:medicare/features/home/ui/widgets/intakes_counter.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/text_styles_manager.dart';
import '../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return state is HomeLoading
            ? IntakeItemShimmerLoading()
            : cubit.medicationsList.isNullOrEmpty
                ? ManageMedScreen()
                : Scaffold(
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
                                  S.of(context).Today,
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
                            S.of(context).Intakes,
                            style: TextStylesManager.font29Bold.copyWith(
                              color: ColorsManager.c196EB0,
                            ),
                          ),
                          verticalSpace(45),
                          IntakesCounter(),
                          verticalSpace(40),
                          IntakesBlocBuilder(),
                        ],
                      ),
                    ),
                    floatingActionButton: FabButton(),
                  );
      },
    );
  }
}
