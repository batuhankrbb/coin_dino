import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextStyle rockoFLFStyle({Color? color, double? fontSize}) => TextStyle(
      color: color ?? Colors.black,
      fontFamily: "RockoFLF",
      fontSize: fontSize ?? 25);
  TextStyle descriptionStyle({Color? color, double? fontSize}) =>
      TextStyle(color: color ?? Colors.grey, fontSize: fontSize ?? 17);
}
