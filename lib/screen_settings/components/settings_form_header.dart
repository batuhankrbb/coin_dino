import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class SettingsFormHeader extends StatelessWidget {
  final String headerTitle;
  final IconData headerIcon;
  const SettingsFormHeader(
      {Key? key, required this.headerTitle, required this.headerIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          AutoSizeText(
            headerTitle,
            style: TextStyle(
              fontSize: context.getWidth(0.045),
            ),
          ),
          Spacer(),
          Icon(
            headerIcon,
            size: context.getHeight(0.03),
          ),
        ],
      ),
    );
  }
}
