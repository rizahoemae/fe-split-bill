import 'package:flutter/material.dart';

class ValueText extends StatelessWidget {
  const ValueText({super.key, required this.title, required this.value});
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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(value, textAlign: TextAlign.end),
          ),
        ),
      ],
    );
  }
}
