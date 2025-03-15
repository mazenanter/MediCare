import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/features/register/logic/register_cubit.dart';
import 'package:medicare/features/register/logic/register_state.dart';

import '../../../../core/routing/routes.dart';
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
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: CircularProgressIndicator(),
                content: Text('Creating email...'),
              );
            },
          );
        }, registerSuccess: () {
          context.pop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(FontAwesomeIcons.circleCheck, color: Colors.green),
                title: Text(S.of(context).Success),
                content: Text(S.of(context).EmailCreatedSuccessfully),
                actions: [
                  TextButton(
                    child: Text(S.of(context).Ok),
                    onPressed: () {
                      context.pop();
                      context.pushNamedAndRemoveUntil(Routes.loginScreen);
                    },
                  ),
                ],
              );
            },
          );
        }, registerError: (message) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(FontAwesomeIcons.circleXmark, color: Colors.red),
                title: Text(S.of(context).Error),
                content: Text(message),
                actions: [
                  TextButton(
                    child: Text(S.of(context).Ok),
                    onPressed: () => context.pop(),
                  ),
                ],
              );
            },
          );
        });
      },
      child: SizedBox.shrink(),
    );
  }
}
