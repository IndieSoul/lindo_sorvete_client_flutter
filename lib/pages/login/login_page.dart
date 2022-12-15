import 'package:flutter/material.dart';
import 'package:lindosorveteclient/pages/login/login_controller.dart';
import 'package:lindosorveteclient/pages/register/register_page.dart';
import 'package:lindosorveteclient/pages/remember_password/remember_password_page.dart';
import 'package:lindosorveteclient/widgets/elevated_button_rounded.dart';
import 'package:lindosorveteclient/widgets/ice_cream_background.dart';
import 'package:lindosorveteclient/widgets/text_button_underline.dart';
import 'package:lindosorveteclient/widgets/text_subtitle.dart';
import 'package:lindosorveteclient/widgets/text_title.dart';
import 'package:lindosorveteclient/widgets/textfield_rouded.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IceCreamBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextSubtitle(text: 'HELADOS'),
                    const SizedBox(height: 20),
                    const TextTitle(text: 'Lindo\nSorvete'),
                    const SizedBox(height: 20),
                    TextFieldRounded(
                      controller: loginController.emailTextEditingController,
                      hintText: 'correo@lindosorvete.com',
                      iconData: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFieldRounded(
                      controller: loginController.passwordTextEditingController,
                      hintText: 'Contraseña',
                      obscureText: true,
                      iconData: Icons.password,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButtonRounded(
                      text: 'Entrar',
                      onPressed: () {
                        loginController.login(context: context);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButtonRounded(
                      text: 'Crear Cuenta',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 80),
                    TextButtonUnderline(
                      text: 'Recordar Contraseña',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RememberPasswordPage(),
                          ),
                        );
                      },
                    ),
                    TextButtonUnderline(
                      text: 'Política de Privacidad',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
