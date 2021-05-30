import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

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
