import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

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
      behavior: HitTestBehavior.translucent,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              leading,
              Spacer(flex: 3),
              Expanded(
                flex: 80,
                child: buildTitles(context),
              ),
              Spacer(flex: 6),
              getTrailing(),
            ],
          )),
    );
  }

  Widget buildTitles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: context.getWidth(0.04)),
        ),
        getSubtitle(context),
      ],
    );
  }

  Widget getSubtitle(BuildContext context) {
    if (subTitle == null) return SizedBox();
    return AutoSizeText(
      subTitle!,
      style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.grey,
          fontSize: context.getWidth(0.025)),
    );
  }

  Widget getTrailing() {
    if (trailing == null) return SizedBox();
    return Expanded(flex: 13, child: trailing!);
  }
}
