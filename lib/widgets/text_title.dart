import 'package:flutter/material.dart';
import 'package:lindosorveteclient/utils/custom_colors.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'edo',
            fontSize: 72,
            color: CustomColors.beigeIceCreamMaterialColor,
          ),
        ),
      ),
    );
  }
}
