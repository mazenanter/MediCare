import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/widgets.dart';

class ToastMessage {
  static void successToast(BuildContext context, String message) =>
      CherryToast.success(
        title: Text(message),
        autoDismiss: true,
        animationType: AnimationType.fromRight,
        animationDuration: Duration(milliseconds: 1000),
      ).show(context);

  static void errorToast(BuildContext context, String message) =>
      CherryToast.error(
        title: Text(message),
        autoDismiss: true,
        animationType: AnimationType.fromRight,
        animationDuration: Duration(milliseconds: 1000),
      ).show(context);
}
