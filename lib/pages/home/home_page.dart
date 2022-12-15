import 'package:flutter/material.dart';
import 'package:lindosorveteclient/pages/home/home_controller.dart';
import 'package:lindosorveteclient/pages/login/login_page.dart';
import 'package:lindosorveteclient/services/auth_services.dart';
import 'package:lindosorveteclient/settings_page/settings_page.dart';
import 'package:lindosorveteclient/widgets/elevated_button_rounded.dart';
import 'package:lindosorveteclient/widgets/ice_cream_background.dart';
import 'package:lindosorveteclient/widgets/map_home.dart';
import 'package:lindosorveteclient/widgets/text_subtitle.dart';
import 'package:lindosorveteclient/widgets/text_title.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IceCreamBackground(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const TextSubtitle(text: 'BIENVENIDO'),
                const SizedBox(height: 20),
                MapHome(homeController: homeController),
                const SizedBox(height: 20),
                ElevatedButtonRounded(
                  text: 'QUIERO HELADO',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                const TextTitle(text: 'SABORES'),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffF9EEE0).withOpacity(0.5),
                    ),
                    child: const TextSubtitle(
                        text: 'Selecciona un heladero en el mapa.'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButtonRounded(
                  text: 'Configuración',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButtonRounded(
                  text: 'Logout',
                  onPressed: () {
                    AuthServices.logout(context: context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
