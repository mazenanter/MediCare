import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/features/register/logic/register_cubit.dart';
import 'package:medicare/features/register/logic/register_state.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/l10n.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterError,
      listener: (context, state) {
        state.whenOrNull(registerLoading: () {
          setupLoading(context);
        }, registerSuccess: (isGoogleSignin) {
          context.pop();
          setupSuccess(context, isGoogleSignin);
        }, registerError: (message) {
          context.pop();
          setupError(context, message);
        });
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
          title: Text(S.of(context).Error, style: TextStylesManager.font16Bold),
          content: Text(message, style: TextStylesManager.font20Meduim),
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(ColorsManager.c196EB0),
              ),
              child: Text(
                S.of(context).Ok,
                style: TextStylesManager.font20Meduim,
              ),
              onPressed: () => context.pop(),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> setupSuccess(BuildContext context, bool isGoogleSginin) {
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
            S.of(context).EmailCreatedSuccessfully,
            style: TextStylesManager.font20Meduim,
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(ColorsManager.c196EB0),
              ),
              onPressed: () {
                if (isGoogleSginin) {
                  context.pushNamedAndRemoveUntil(Routes.homeScreen);
                } else {
                  context.pushReplacementNamed(Routes.loginScreen);
                }
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
