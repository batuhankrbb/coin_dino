import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeCellCustomText extends StatelessWidget {
  const HomeCellCustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    this.padding = 0,
    this.textAlign = TextAlign.end,
    this.minFontSize = 12
  }) : super(key: key);

  final Color textColor;
  final TextAlign textAlign;
  final String text;
  final double fontSize;
  final double padding;
  final double minFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: AutoSizeText(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
        textAlign: textAlign,
        maxLines: 1,
        minFontSize: minFontSize,
      ),
    );
  }
}
