import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:webant_test/core/constants/constants.dart';

class ASText extends StatelessWidget {
  const ASText({
    super.key,
    required this.text,
    required this.color,
    required this.textAlign,
    this.maxFontSize,
    this.fontFamily,
    this.textStyle,
    this.fontWeight,
  });

  final String text;
  final Color color;
  final TextAlign textAlign;
  final double? maxFontSize;
  final TextStyle? textStyle;
  final String? fontFamily;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      maxFontSize: maxFontSize ?? 70,
      style: textStyle ??
          TextStyle(
            fontSize: 70,
            color: color,
            fontFamily: fontFamily ?? fontRoboto,
            fontWeight: fontWeight ?? FontWeight.w400,
            decoration: TextDecoration.none,
          ),
    );
  }
}
