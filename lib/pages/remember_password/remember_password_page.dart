import 'package:flutter/material.dart';
import 'package:lindosorveteclient/widgets/elevated_button_rounded.dart';
import 'package:lindosorveteclient/widgets/ice_cream_background.dart';
import 'package:lindosorveteclient/widgets/text_subtitle.dart';
import 'package:lindosorveteclient/widgets/text_title.dart';
import 'package:lindosorveteclient/widgets/textfield_rouded.dart';

class RememberPasswordPage extends StatelessWidget {
  const RememberPasswordPage({super.key});

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
                const TextFieldRounded(
                  hintText: 'correo@lindosorvete.com',
                  iconData: Icons.mail,
                ),
                const SizedBox(height: 20),
                ElevatedButtonRounded(
                  text: 'Recuperar',
                  onPressed: () {},
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
