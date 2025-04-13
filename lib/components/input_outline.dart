import 'package:flutter/material.dart';
import '../colors.dart';

class InputOutline extends StatelessWidget {
  const InputOutline({
    super.key,
    required this.controller,
    this.center = false,
  });
  final bool center;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.Blue500),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.Blue500),
        ),
        filled: true,
        fillColor: CustomColors.Blue50,
      ),
      controller: controller,
      textAlign: center ? TextAlign.center : TextAlign.start,
    );
  }
}
