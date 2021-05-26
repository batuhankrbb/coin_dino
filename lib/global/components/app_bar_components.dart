import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';

AppBar appbarComponent(
        {String? title,
        List<Widget>? action,
        PreferredSizeWidget? bottom,
        Widget? leading}) =>
    AppBar(
      title: Text(
        title ?? "",
        style: TextStyle(color: CustomColor.shared.backgroundBlueColor),
      ),
      actions: action,
      bottom: bottom,
      leading: leading,
    );
