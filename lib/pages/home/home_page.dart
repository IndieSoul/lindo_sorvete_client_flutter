import 'package:flutter/material.dart';
import 'package:lindosorveteclient/pages/login/login_page.dart';
import 'package:lindosorveteclient/widgets/elevated_button_rounded.dart';
import 'package:lindosorveteclient/widgets/ice_cream_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IceCreamBackground(
        child: SafeArea(
            child: Column(
          children: [
            ElevatedButtonRounded(
              text: 'Logout',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            )
          ],
        )),
      ),
    );
  }
}
