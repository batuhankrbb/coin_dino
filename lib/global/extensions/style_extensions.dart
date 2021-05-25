import 'package:flutter/material.dart';

extension StyleExtension on BuildContext {
  TextStyle rockoFLFStyle({Color? color, double? fontSize}) => TextStyle(
      color: color ?? Colors.black,
      fontFamily: "RockoFLF",
      fontSize: fontSize ?? 25);
  TextStyle descriptionStyle({Color? color, double? fontSize}) =>
      TextStyle(color: color ?? Colors.grey, fontSize: fontSize ?? 17);

  ButtonStyle buttonStyle(
          {required Color backgroundColor,
          double? elevation,
          Color? shadowColor}) =>
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        elevation: MaterialStateProperty.all<double>(elevation ?? 0),
        shadowColor:
            MaterialStateProperty.all<Color>(shadowColor ?? Colors.transparent),
            
      );
}
