import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lindosorveteclient/utils/custom_alerts.dart';
import 'package:lindosorveteclient/widgets/elevated_button_rounded.dart';
import 'package:lindosorveteclient/widgets/ice_cream_background.dart';
import 'package:lindosorveteclient/widgets/text_subtitle.dart';
import 'package:lindosorveteclient/widgets/text_title.dart';
import 'package:lindosorveteclient/widgets/textfield_rouded.dart';

class RememberPasswordPage extends StatelessWidget {
  RememberPasswordPage({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IceCreamBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const TextTitle(text: 'Recuperar\nContraseña'),
                const SizedBox(height: 20),
                const TextSubtitle(
                  textAlign: TextAlign.center,
                  text:
                      'Escribe el correo electronico con el que te registarte para recibir instrucciones para recuperar tu contraseña:',
                ),
                const SizedBox(height: 20),
                TextFieldRounded(
                  controller: textEditingController,
                  hintText: 'correo@lindosorvete.com',
                  iconData: Icons.mail,
                ),
                const SizedBox(height: 20),
                ElevatedButtonRounded(
                  text: 'Recuperar',
                  onPressed: () async {
                    if (textEditingController.text == "") {
                      CustomAlerts.showAlertTextAndButton(
                        context: context,
                        title: 'Coloca tu email',
                        text: 'Coloca tu email para recuperar tu contraseña.',
                        buttonText: 'Continuar',
                      );
                      return;
                    }

                    if (!EmailValidator.validate(
                        textEditingController.text.trim())) {
                      CustomAlerts.showAlertTextAndButton(
                        context: context,
                        title: 'Coloca un email valido',
                        text: 'Coloca una direccion de email valida.',
                        buttonText: 'Continuar',
                      );
                      return;
                    }

                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: textEditingController.text.trim());
                    } catch (e) {
                      CustomAlerts.showAlertTextAndButton(
                        context: context,
                        title: 'Error',
                        text: e.toString(),
                        buttonText: 'Continuar',
                      );
                      return;
                    }

                    CustomAlerts.showAlertTextAndButton(
                      context: context,
                      title: 'Correo enviado',
                      text:
                          'Se ha enviado un correo a tu dirección de email con las intrucciones para recuperar tu contraseña.',
                      buttonText: 'Continuar',
                    );
                  },
                ),
                const Spacer(),
                ElevatedButtonRounded(
                  text: 'Regresar',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
