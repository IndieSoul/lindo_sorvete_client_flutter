import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lindosorveteclient/pages/home/home_page.dart';
import 'package:lindosorveteclient/widgets/elevated_button_rounded.dart';
import 'package:lindosorveteclient/widgets/ice_cream_background.dart';
import 'package:lindosorveteclient/widgets/text_subtitle.dart';
import 'package:lindosorveteclient/widgets/text_title.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IceCreamBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextTitle(text: 'Localización'),
                    const SizedBox(height: 20),
                    const TextSubtitle(
                      textAlign: TextAlign.center,
                      text:
                          'Lindo Sorvete requiere de tu permizo para utilizar tu ubicación, con ella la apliación le notificara al heladero el punto el que debe llegar.',
                    ),
                    const SizedBox(height: 20),
                    const TextSubtitle(
                      textAlign: TextAlign.center,
                      text:
                          'Esta información solo es guardada mientras el llamado esta en curso para poder ser consultada por el heladero, sera eliminada una vez finalizado el preceso.',
                    ),
                    const SizedBox(height: 20),
                    const TextSubtitle(
                      textAlign: TextAlign.center,
                      text:
                          'Tu ubicación jumas sera usada para otro proposito que el mencionado aquí.',
                    ),
                    const SizedBox(height: 20),
                    ElevatedButtonRounded(
                      text: 'Activar Permiso',
                      onPressed: () async {
                        bool serviceEnabled;
                        LocationPermission permission;

                        // Test if location services are enabled.
                        serviceEnabled =
                            await Geolocator.isLocationServiceEnabled();

                        Geolocator.requestPermission();

                        if (!serviceEnabled) {
                          // Location services are not enabled don't continue
                          // accessing the position and request users of the
                          // App to enable the location services.
                          Geolocator.openAppSettings();
                          return;
                        }

                        permission = await Geolocator.checkPermission();
                        if (permission == LocationPermission.denied) {
                          permission = await Geolocator.requestPermission();
                          if (permission == LocationPermission.denied) {
                            // Permissions are denied, next time you could try
                            // requesting permissions again (this is also where
                            // Android's shouldShowRequestPermissionRationale
                            // returned true. According to Android guidelines
                            // your App should show an explanatory UI now.
                            Geolocator.openAppSettings();
                            return;
                          }
                        }

                        if (permission == LocationPermission.deniedForever) {
                          // Permissions are denied forever, handle appropriately.
                          Geolocator.openAppSettings();
                          return;
                        }

                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
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
