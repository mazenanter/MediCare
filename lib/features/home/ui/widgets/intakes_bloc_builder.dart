import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/features/home/logic/home_cubit.dart';
import 'package:medicare/features/home/logic/home_state.dart';
import 'package:medicare/features/home/ui/widgets/intakes_list_view.dart'
    show IntakesListView;

class IntakesBlocBuilder extends StatelessWidget {
  const IntakesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeSuccess || current is HomeError,
      builder: (context, state) {
        return state.maybeWhen(
          homeLoading: () => Lottie.asset('assets/animation/loading2.json'),
          orElse: () => SizedBox.shrink(),
          homeSuccess: (medications) {
            return IntakesListView(medications: medications);
          },
          homeError: (message) {
            return Center(
              child: Text(message),
            );
          },
        );
      },
    );
  }
}
