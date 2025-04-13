import 'package:flutter/material.dart';

class ValueText extends StatelessWidget {
  const ValueText({
    super.key,
    required this.title,
    required this.value,
    this.bold = false,
  });
  final bool bold;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Expanded(child: Text(value, textAlign: TextAlign.end)),
      ],
    );
  }
}
