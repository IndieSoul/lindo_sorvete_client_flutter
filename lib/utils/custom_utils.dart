import 'package:flutter/material.dart';

class CustomUtils {
  static void hideKeyboard({required BuildContext context}) {
    // Escoder teclado
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }
}
