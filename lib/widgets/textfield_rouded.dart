import 'package:flutter/material.dart';

class TextFieldRounded extends StatelessWidget {
  const TextFieldRounded({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.iconData,
    this.keyboardType,
  });

  final String? hintText;
  final IconData? iconData;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontFamily: 'Montserrat',
        ),
        obscureText: obscureText,
        textAlignVertical: (iconData != null) ? TextAlignVertical.center : null,
        decoration: InputDecoration(
          prefixIcon: (iconData != null) ? Icon(iconData) : null,
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.only(left: 20.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
