import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/core/helpers/extenstions.dart';
import 'package:medicare/core/routing/routes.dart';
import 'package:medicare/core/theming/text_styles_manager.dart';
import 'package:medicare/core/widgets/custom_alert_dialog.dart';
import 'package:medicare/features/details/logic/details_cubit.dart';
import 'package:medicare/features/details/logic/details_state.dart';

import '../../../../generated/l10n.dart';

class DetailsBlocListener extends StatelessWidget {
  const DetailsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailsCubit, DetailsState>(
      listenWhen: (previous, current) =>
          current is DeleteSuccess ||
          current is DeleteError ||
          current is DeleteLoading,
      listener: (context, state) {
        if (state is! DeleteLoading && Navigator.canPop(context)) {
          context.pop();
        }
        state.whenOrNull(
          deleteLoading: () {
            setupDeleteLoading(context);
          },
          deleteSuccess: () {
            context.pop();
            setupDeleteSuccess(context);
          },
          deleteError: (message) {
            context.pop();
            setupDeleteError(context, message);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  void setupDeleteLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Lottie.asset(
            'assets/animation/loading2.json',
          ),
        );
      },
    );
  }

  void setupDeleteSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          content: S.of(context).DeletedSuccessfully,
          icon: Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          title: S.of(context).Success,
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
                context.pushNamedAndRemoveUntil(Routes.homeScreen);
              },
              child: Text(
                S.of(context).Ok,
                style: TextStylesManager.font16Bold,
              ),
            ),
          ],
        );
      },
    );
  }

  void setupDeleteError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          content: message,
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          title: S.of(context).Error,
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                S.of(context).Ok,
                style: TextStylesManager.font16Bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
