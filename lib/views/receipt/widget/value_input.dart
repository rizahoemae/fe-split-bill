import 'package:flutter/material.dart';
import '../../../components/input_outline.dart';

class ValueInput extends StatelessWidget {
  const ValueInput({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Expanded(
          child: InputOutline(controller: TextEditingController(text: value)),
        ),
      ],
    );
  }
}
