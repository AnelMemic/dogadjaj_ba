import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  const CustomIconButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: 330,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              visualDensity: const VisualDensity(horizontal: 4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const Spacer(),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
