import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
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
            headerTitle.tr(),
            style: TextStyle(
              fontSize: context.getWidth(0.045),
               color: context.colorScheme.primary,
            ),
          ),
          Spacer(),
          Icon(
            headerIcon,
            size: context.getHeight(0.03),
             color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

