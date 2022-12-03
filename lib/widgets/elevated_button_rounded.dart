import 'package:flutter/material.dart';

class ElevatedButtonRounded extends StatelessWidget {
  const ElevatedButtonRounded({super.key, required this.text, this.onPressed});

  final String text;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 200),
      child: ElevatedButton(
        onPressed: (onPressed != null)
            ? () {
                onPressed!();
              }
            : null,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
