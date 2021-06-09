import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

AppBar appbarComponent(
        {String? title,
        List<Widget>? action,
        PreferredSizeWidget? bottom,
        Widget? leading,
        Color? titleColor}) =>
    AppBar(
      title: Text(
        title ?? "",
        style: TextStyle(
            color: titleColor ?? CustomColor.shared.backgroundBlueColor,
            fontSize: 15),
      ),
      actions: action,
      bottom: bottom,
      leading: leading,
    );
