import 'package:flutter/material.dart';
import 'package:lindosorveteclient/pages/login/login_page.dart';
import 'package:lindosorveteclient/utils/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lindo Sorvete',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CustomColors.oragenIceCreamMaterialColor,
      ),
      home: LoginPage(),
    );
  }
}
