import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lindosorveteclient/settings_page/settings_controller.dart';
import 'package:lindosorveteclient/widgets/elevated_button_rounded.dart';
import 'package:lindosorveteclient/widgets/ice_cream_background.dart';
import 'package:lindosorveteclient/widgets/text_subtitle.dart';
import 'package:lindosorveteclient/widgets/text_title.dart';
import 'package:lindosorveteclient/widgets/textfield_rouded.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final SettingsController settingsController = SettingsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IceCreamBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TextSubtitle(text: 'Configuración'),
                  const TextTitle(text: 'Tu Foto'),
                  const SizedBox(height: 20),
                  _CircleAvatarUploadImage(
                      settingsController: settingsController),
                  const SizedBox(height: 20),
                  TextFieldRounded(
                    iconData: Icons.person,
                    hintText: 'Nombre',
                  ),
                  const SizedBox(height: 20),
                  TextFieldRounded(
                    iconData: Icons.email,
                    hintText: 'correo@lindosorvete.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  TextFieldRounded(
                    iconData: Icons.phone,
                    hintText: 'Telefono',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  TextFieldRounded(
                    iconData: Icons.password,
                    obscureText: true,
                    hintText: 'Contraseña',
                  ),
                  const SizedBox(height: 20),
                  TextFieldRounded(
                    iconData: Icons.password,
                    obscureText: true,
                    hintText: 'Confirma tu contraseña',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButtonRounded(
                    text: 'Guardar',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  ElevatedButtonRounded(
                    text: 'Regresar',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleAvatarUploadImage extends StatefulWidget {
  const _CircleAvatarUploadImage({required this.settingsController});

  final SettingsController settingsController;

  @override
  State<_CircleAvatarUploadImage> createState() =>
      _CircleAvatarUploadImageState();
}

class _CircleAvatarUploadImageState extends State<_CircleAvatarUploadImage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      child: (widget.settingsController.image != null)
          ? ClipOval(
              child: (kIsWeb)
                  ? Image.network(
                      widget.settingsController.image!.path,
                      fit: BoxFit.cover,
                      width: (size.width * 0.6 < 300) ? size.width * 0.6 : 300,
                      height: (size.width * 0.6 < 300) ? size.width * 0.6 : 300,
                    )
                  : Image.file(
                      File(widget.settingsController.image!.path),
                      fit: BoxFit.cover,
                      width: (size.width * 0.6 < 300) ? size.width * 0.6 : 300,
                      height: (size.width * 0.6 < 300) ? size.width * 0.6 : 300,
                    ),
            )
          : CircleAvatar(
              radius: (size.width * 0.3 < 150) ? size.width * 0.3 : 150,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: (size.width * 0.3 < 80) ? size.width * 0.3 : 80,
              ),
            ),
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        widget.settingsController.image =
            await picker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
    );
  }
}
