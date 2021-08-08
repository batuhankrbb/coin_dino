import 'package:flutter/material.dart';

extension EasyContext on BuildContext {
  double getHeight(double ratio) => MediaQuery.of(this).size.height * ratio;
  double getWidth(double ratio) => MediaQuery.of(this).size.width * ratio;
}
