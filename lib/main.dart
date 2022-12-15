import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lindosorveteclient/firebase_options.dart';
import 'package:lindosorveteclient/pages/loading_app/loading_app_page.dart';
import 'package:lindosorveteclient/utils/custom_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const LoadingAppPage(),
    );
  }
}
