import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final bool isObscure;
  const TextInputField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.labelText,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: kBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(5),
          borderSide: const BorderSide(color: kBorderColor),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
