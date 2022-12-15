import 'package:flutter/material.dart';
import 'package:lindosorveteclient/widgets/loading_circular_progress_indicator.dart';

class CustomAlerts {
  static Future<void> showAlertTextAndButton({
    required BuildContext context,
    required String title,
    required String text,
    required String buttonText,
    Function? onPressed,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) onPressed();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showAlertTextAndTwoButton({
    required BuildContext context,
    required String title,
    required String text,
    required String buttonText1,
    Function? onPressed1,
    required String buttonText2,
    Function? onPressed2,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(buttonText1),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed1 != null) onPressed1();
              },
            ),
            TextButton(
              child: Text(buttonText2),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed2 != null) onPressed2();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showAlertLoading({required BuildContext context}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: LoadingCircularProgressIndicator(),
        );
      },
    );
  }
}
