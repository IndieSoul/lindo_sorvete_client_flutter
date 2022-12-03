import 'package:flutter/material.dart';
import 'package:lindosorveteclient/utils/custom_colors.dart';

class TextButtonUnderline extends StatelessWidget {
  const TextButtonUnderline({super.key, required this.text, this.onPressed});

  final String text;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (onPressed != null)
          ? () {
              onPressed!();
            }
          : null,
      child: Text(
        text,
        style: const TextStyle(
          color: CustomColors.witheIceCreamMaterialColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
