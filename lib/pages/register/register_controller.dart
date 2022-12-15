import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lindosorveteclient/models/client.dart';
import 'package:lindosorveteclient/pages/loading_home/loading_home.dart';
import 'package:lindosorveteclient/utils/custom_alerts.dart';
import 'package:lindosorveteclient/utils/custom_utils.dart';

class RegisterControllert {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController =
      TextEditingController();

  XFile? image;

  void registerUser({required BuildContext context}) async {
    if (image == null) {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Sube tu foto de perfil',
        text:
            'Coloca una foto de perfil para que el heladero pueda reconocerte.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (nameTextEditingController.text == "") {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Coloca tu nombre',
        text: 'Coloca tu nombre de usuario para la aplicación.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (emailTextEditingController.text == "") {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Coloca tu email',
        text: 'Coloca tu email con al cual se identificara tu cuenta.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (!EmailValidator.validate(emailTextEditingController.text.trim())) {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Coloca un email valido',
        text:
            'Coloca un email valido para usar como identificador de tu cuenta.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (phoneTextEditingController.text == "") {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Coloca tu numero de celular',
        text:
            'Coloca tu numero de celular para que el heladero pueda contactar contigo al llegar.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (!CustomUtils.isNumeric(phoneTextEditingController.text)) {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Coloca solo numero',
        text:
            'Solo puedes colocar numeros en el campo para tu numero de celular.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (passwordTextEditingController.text == "") {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Coloca tu contraseña',
        text: 'Coloca tu contraseña para poder ingresar a tu cuenta.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (passwordTextEditingController.text.length < 8) {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Contraseña incorrecta',
        text: 'Tu contraseña debe tener almenos 8 letras.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (confirmpasswordTextEditingController.text == "") {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Confirma tu contraseña',
        text: 'Confirma tu contraseña para poder ingresar a tu cuenta.',
        buttonText: 'Continuar',
      );
      return;
    }

    if (passwordTextEditingController.text !=
        confirmpasswordTextEditingController.text) {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Confirma tu contraseña',
        text: 'Las contraseñas deben coincidir.',
        buttonText: 'Continuar',
      );
      return;
    }

    CustomAlerts.showAlertLoading(context: context);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text);
    } catch (e) {
      CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Error',
        text: e.toString(),
        buttonText: 'Continuar',
        onPressed: () {
          Navigator.pop(context);
        },
      );
      return;
    }

    Uint8List fileBytes = await image!.readAsBytes();
    final Reference storage = FirebaseStorage.instance.ref();

    await storage
        .child("profilePhoto/${FirebaseAuth.instance.currentUser!.uid}.jpg")
        .putData(
          fileBytes,
          SettableMetadata(
            contentType: "image/jpeg",
          ),
        );

    Client client = Client(
      email: emailTextEditingController.text.trim(),
      name: nameTextEditingController.text,
      phone: phoneTextEditingController.text,
      photoUrl: await storage
          .child("profilePhoto/${FirebaseAuth.instance.currentUser!.uid}.jpg")
          .getDownloadURL(),
      uid: FirebaseAuth.instance.currentUser!.uid,
    );

    await FirebaseFirestore.instance
        .collection('clients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(
          client.toMap(),
        );

    CustomAlerts.showAlertTextAndButton(
        context: context,
        title: 'Usuario creado correctamente',
        text:
            'Tu usuario se ha registrado correctamente, ya puedes pedir helado.',
        buttonText: 'Continuar',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoadingHomePage(),
            ),
          );
        });
  }
}
