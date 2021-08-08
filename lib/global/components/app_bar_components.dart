import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../utils/custom_colors.dart';

AppBar customAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? action,
  PreferredSizeWidget? bottom,
  Widget? leading,
  Color? titleColor,
}) =>
    AppBar(
      title: Text(
        title ?? "",
        style: TextStyle(
          color: titleColor ?? CustomColor.shared.backgroundBlueColor,
          fontSize: context.getWidth(0.05),
        ),
      ),
      actions: action,
      bottom: bottom,
      leading: leading,
    );
