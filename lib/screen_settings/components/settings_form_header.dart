import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SettingsFormHeader extends StatelessWidget {
  final String headerTitle;
  final Widget headerIcon;
  const SettingsFormHeader(
      {Key? key, required this.headerTitle, required this.headerIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(headerTitle),
          Spacer(),
          headerIcon,
        ],
      ),
    );
  }
}
