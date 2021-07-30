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

class SettingFormRowWidget extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subTitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const SettingFormRowWidget(
      {Key? key,
      required this.leading,
      this.subTitle,
      required this.title,
      this.trailing,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              leading,
              Spacer(flex: 5),
              Expanded(
                flex: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(title,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    getSubtitle(),
                  ],
                ),
              ),
              Spacer(flex: 6),
              getTrailing(),
            ],
          )),
    );
  }

  Widget getSubtitle() {
    if (subTitle == null) return SizedBox();
    return AutoSizeText(
      subTitle!,
      style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    );
  }

  Widget getTrailing() {
    if (trailing == null) return SizedBox();
    return Expanded(flex: 13, child: trailing!);
  }
}
