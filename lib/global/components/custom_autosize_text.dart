import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


//TODO DEVAM EDİLECEK
class CustomAutoSizeText extends StatelessWidget {
  CustomAutoSizeText({Key? key, required this.text, required this.textStyle, this.maxLines}) : super(key: key);

  String text;
  TextStyle textStyle;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: 14,
      maxLines: maxLines,
      style: textStyle,
    );
  }
}
