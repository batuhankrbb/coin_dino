import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

//TODO DEVAM EDİLECEK
class CustomAutoSizeText extends StatelessWidget {
  CustomAutoSizeText(
      {Key? key, required this.text, required this.textStyle, this.maxLines, this.minFontSize = 14.0})
      : super(key: key);

  String text;
  TextStyle textStyle;
  int? maxLines;
  double minFontSize;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: minFontSize,
      maxLines: maxLines,
      style: textStyle,
    );
  }
}
