import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../../colors.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      dashLength: 6,
      dashColor: CustomColors.Blue500,
      lineThickness: 2.0,
    );
  }
}
