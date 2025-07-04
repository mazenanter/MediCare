import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
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
import 'package:medicare/features/setting/ui/settings_drawer.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/localization/locale_cubit.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/text_styles_manager.dart';
import '../../../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final isArabic = context.watch<LocaleCubit>().isArabic;

        return state is HomeLoading
            ? IntakeItemShimmerLoading()
            : cubit.medicationsList.isNullOrEmpty
                ? ManageMedScreen()
                : AdvancedDrawer(
                    drawer: SettingsDrawer(),
                    controller: _advancedDrawerController,
                    animationCurve: Curves.easeInOut,
                    animationDuration: const Duration(milliseconds: 300),
                    animateChildDecoration: true,
                    rtlOpening: isArabic ? true : false,
                    disabledGestures: false,
                    childDecoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Scaffold(
                      body: SafeArea(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Builder(builder: (context) {
                                    return HomeTopBar(
                                      onTapSetting: () {
                                        _handleMenuButtonPressed();
                                      },
                                    );
                                  }),
                                  verticalSpace(30),
                                  Text(
                                    S.of(context).Today,
                                    style:
                                        TextStylesManager.font29Bold.copyWith(
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
                    ),
                  );
      },
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
