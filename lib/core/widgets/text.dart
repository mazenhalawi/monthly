import 'package:flutter/material.dart';
import 'package:mobile_recruitment_test/core/utils/colors.dart';

enum LTextType {
  small(12),
  medium(16);

  const LTextType(this.font);
  final double font;
}

class LText extends StatelessWidget {
  final String text;
  final LTextType type;
  final Color? color;
  final FontWeight? fontWeight;

  const LText({
    required this.text,
    required this.type,
    this.color,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: type.font,
        color: color ?? LColors.shade85,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
