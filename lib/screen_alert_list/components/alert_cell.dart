import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AlertCell extends StatelessWidget {
  const AlertCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey,
      leading: Container(
        height: 50,
        width: 50,
        color: Colors.red,
      ),
      title: AutoSizeText(
        "Polygon",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      subtitle: AutoSizeText("MATIC"),
      trailing: AutoSizeText("\$1.45"),
    );
  }
}
