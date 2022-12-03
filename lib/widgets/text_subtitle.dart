import 'package:flutter/material.dart';
import 'package:lindosorveteclient/utils/custom_colors.dart';

class TextSubtitle extends StatelessWidget {
  const TextSubtitle({
    super.key,
    required this.text,
    this.textAlign,
  });

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: textAlign,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: CustomColors.witheIceCreamMaterialColor,
        ),
      ),
    );
  }
}
