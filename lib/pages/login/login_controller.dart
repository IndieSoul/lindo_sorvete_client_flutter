import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lindosorveteclient/pages/loading_home/loading_home.dart';
import 'package:lindosorveteclient/utils/custom_alerts.dart';

class LoginController {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  void login({required BuildContext context}) async {
    if (emailTextEditingController.text == "") {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Ingresa tu email',
        text: 'Ingresa tu email para acceder a tu cuenta.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (!EmailValidator.validate(emailTextEditingController.text.trim())) {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Ingresa un email valido',
        text: 'Ingresa una dirección de email valida.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (passwordTextEditingController.text == "") {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Ingresa tu contraseña',
        text: 'Ingresa tu contraseña para acceder a tu cuenta.',
        buttonText: 'Continuar',
      );
      return;
    }

    CustomAlerts.showAlertLoading(context: context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
    } catch (e) {
      Navigator.pop(context);
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Error',
        text: e.toString(),
        buttonText: 'Continuar',
      );
      return;
    }

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoadingHomePage(),
      ),
    );
  }
}
