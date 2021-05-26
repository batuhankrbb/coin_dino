import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(title: "Settings"),
      body: Container(
        child: Column(
          children: [
            SettingsCell(
              onTap: () {},
              title: "Calculator",
              subtitle: "deneme dendemednede anasdınasdas",
              trailing: Icon(Icons.calculate),
            ),
            SettingsHeader(title: "deneme")
          ],
        ),
      ),
    );
  }
}

class SettingsHeader extends StatelessWidget {
  SettingsHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 6, bottom: 6),
      alignment: Alignment.centerLeft,
      child: CustomAutoSizeText(
        text: title,
        textStyle: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}

class SettingsCell extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color titleColor;
  final Widget trailing;
  final VoidCallback onTap;

  const SettingsCell({
    Key? key,
    required this.title,
    required this.trailing,
    required this.onTap,
    this.subtitle,
    this.titleColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Container(
        color: Colors.white60,
        height: screenInfo.screenSize.height * 0.08,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              flex: 85,
              child: buildTextColumns(),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 15,
              child: trailing,
            )
          ],
        ),
      );
    });
  }

  Widget buildTextColumns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 50,
          child: getTitle(),
        ),
        if (getSubTitle() != null)
          Expanded(
            flex: 50,
            child: getSubTitle()!,
          ),
      ],
    );
  }

  Widget getTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: CustomAutoSizeText(
        text: title,
        textStyle: TextStyle(
            color: titleColor, fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget? getSubTitle() {
    if (subtitle == null) return null;
    return CustomAutoSizeText(
      text: subtitle!,
      textStyle: TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
    );
  }
}
