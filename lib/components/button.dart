import 'package:flutter/material.dart';
import '../colors.dart';

enum ButtonType { primary, secondary, tertiary }

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.label,
    this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
  });
  final VoidCallback? onPressed;
  final ButtonType type;
  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (type) {
      case ButtonType.primary:
        backgroundColor = CustomColors.Blue500;
        textColor = Colors.white;
        break;
      case ButtonType.secondary:
        backgroundColor = CustomColors.Blue200;
        textColor = CustomColors.Blue500;
        break;
      case ButtonType.tertiary:
        backgroundColor = Colors.transparent;
        textColor = Colors.blue;
        break;
    }

    return FilledButton(
      onPressed: onPressed,
      child:
          icon != null
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [icon!, const SizedBox(width: 8), Text(label)],
              )
              : Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
