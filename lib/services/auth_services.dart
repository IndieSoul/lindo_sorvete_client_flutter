import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static void logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
  }
}
