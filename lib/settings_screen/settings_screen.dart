import 'package:auto_size_text/auto_size_text.dart';
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
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CupertinoFormSection(
              header: SettingsFormHeader(
                headerTitle: "Kişisel Ayarlar",
                headerIcon: Icon(Icons.ac_unit),
              ),
              children: [
                SettingFormRowWidget(
                  leading: Icon(Icons.sanitizer),
                  subTitle: "1",
                  title: "2",
                  trailing: Icon(Icons.ac_unit),
                ),
                SettingFormRowWidget(
                  leading: Icon(Icons.sanitizer),
                  subTitle: "DASDASD",
                  title: "DASDAS",
                  trailing: Icon(Icons.ac_unit),
                ),
                SettingFormRowWidget(
                  leading: Icon(Icons.sanitizer),
                  subTitle: "DASDASD",
                  title: "DASDAS",
                  trailing: Icon(Icons.ac_unit),
                ),
                SettingFormRowWidget(
                  leading: Icon(Icons.sanitizer),
                  subTitle: "DASDASD",
                  title: "DASDAS",
                  trailing: Icon(Icons.ac_unit),
                ),
              ],
            ),
            CupertinoFormSection(
              header: Text("Uygulama Ayarları"),
              children: [
                CupertinoFormRow(child: Text("dsad")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
  final String subTitle;
  final Widget trailing;
  const SettingFormRowWidget(
      {Key? key,
      required this.leading,
      required this.subTitle,
      required this.title,
      required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(flex: 15, child: leading),
            Expanded(
              flex: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(title,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  AutoSizeText(subTitle,
                      style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey))
                ],
              ),
            ),
            Spacer(flex: 50),
            Expanded(flex: 13, child: trailing),
          ],
        ));
  }
}
