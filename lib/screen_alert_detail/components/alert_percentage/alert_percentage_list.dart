import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class AlertPercentageList extends StatefulWidget {
  AlertPercentageList({Key? key}) : super(key: key);

  @override
  _AlertPercentageListState createState() => _AlertPercentageListState();
}

class _AlertPercentageListState extends State<AlertPercentageList> {
  var percentageList = [-20, -10, -5, 5, 10, 20];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: percentageList
            .map(
              (e) => Expanded(
                child: buildPercentageWidget(e),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildPercentageWidget(int percentage) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(context.getWidth(0.01)),
      child: AutoSizeText(
        "$percentage%",
        style: TextStyle(fontSize: context.getWidth(0.05)),
        maxLines: 1,
      ),
    );
  }
}
