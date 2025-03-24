import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/core/helpers/extenstions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles_manager.dart';
import '../../../../generated/l10n.dart';
import '../../logic/add_med_cubit.dart';
import '../../logic/add_med_state.dart';

class AddMedBlocListener extends StatelessWidget {
  const AddMedBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMedCubit, AddMedState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error ||
          current is Update,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            setupLoading(context);
          },
          success: (message) {
            context.pop();
            setupSuccess(context, message);
          },
          error: (message) {
            context.pop();
            setupError(context, message);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  Future<dynamic> setupLoading(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Lottie.asset('assets/animation/loading.json'),
        );
      },
    );
  }

  Future<dynamic> setupError(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          icon: Icon(
            FontAwesomeIcons.circleXmark,
            color: Colors.red,
            size: 50,
          ),
          title: Text(
            S.of(context).Error,
            style: TextStylesManager.font16Bold,
            textAlign: TextAlign.center,
          ),
          content: Text(
            message,
            style: TextStylesManager.font20Meduim,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(ColorsManager.c196EB0),
              ),
              child: Text(
                S.of(context).Ok,
                style: TextStylesManager.font20Meduim,
                textAlign: TextAlign.center,
              ),
              onPressed: () => context.pop(),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> setupSuccess(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          icon: Icon(
            FontAwesomeIcons.circleCheck,
            color: Colors.green,
            size: 50,
          ),
          title: Text(
            S.of(context).Success,
            style: TextStylesManager.font16Bold,
          ),
          content: Text(
            message,
            style: TextStylesManager.font20Meduim,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(ColorsManager.c196EB0),
              ),
              onPressed: () {
                context.pushReplacementNamed(Routes.homeScreen);
              },
              child: Text(
                S.of(context).Ok,
                style: TextStylesManager.font20Meduim,
              ),
            ),
          ],
        );
      },
    );
  }
}
