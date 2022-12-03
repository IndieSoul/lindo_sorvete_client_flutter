import 'package:flutter/material.dart';
import 'package:lindosorveteclient/widgets/circle_avatar_upload_image.dart';
import 'package:lindosorveteclient/widgets/elevated_button_rounded.dart';
import 'package:lindosorveteclient/widgets/ice_cream_background.dart';
import 'package:lindosorveteclient/widgets/text_subtitle.dart';
import 'package:lindosorveteclient/widgets/text_title.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IceCreamBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const TextSubtitle(text: 'Crear Cuenta'),
                const TextTitle(text: 'Tu Foto'),
                const SizedBox(height: 20),
                const CircleAvatarUploadImage(),
                const SizedBox(height: 20),
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
