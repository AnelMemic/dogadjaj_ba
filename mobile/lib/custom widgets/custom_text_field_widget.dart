import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String text;
  const CustomTextFieldWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        height: 45,
        child: TextField(
          style: const TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 194, 194, 194),
            labelText: text,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          ),
        ),
      ),
    );
  }
}
