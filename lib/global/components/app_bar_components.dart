import 'package:flutter/services.dart';

import 'icon_back_button.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import '../utils/custom_colors.dart';

AppBar customAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? action,
  PreferredSizeWidget? bottom,
  Widget? leading,
  Color? titleColor,
  Color? backgroundColor,
  bool showBackButton = false,
}) =>
    AppBar(
      brightness: context.colorScheme.brightness,
      backgroundColor: backgroundColor,
      title: Text(
        title ?? "",
        style: TextStyle(
          color: titleColor ?? context.colorScheme.onBackground,
          fontSize: context.getWidth(0.05),
        ),
      ),
      actions: action,
      bottom: bottom,
      leading: leading ?? (showBackButton ? IconBackButton() : null),
    );
