import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class HomeTableHeader extends StatefulWidget {
  HomeTableHeader(
      {Key? key, required this.itemFlexList, required this.spacerFlexList})
      : super(key: key);

  @override
  _HomeTableHeaderState createState() => _HomeTableHeaderState();

  final List<int> itemFlexList;
  final List<int> spacerFlexList;
}

class _HomeTableHeaderState extends State<HomeTableHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(0.08),
      color: context.colorScheme.primaryVariant,
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: widget.itemFlexList[0],
            child: Container(
              color: Colors.red,
            ),
          ),
          Spacer(
            flex: widget.spacerFlexList[1],
          ),
          Expanded(
            flex: widget.itemFlexList[1],
            child: Container(
              color: Colors.green,
            ),
          ),
          Spacer(
            flex: widget.spacerFlexList[2],
          ),
          Expanded(
            flex: widget.itemFlexList[2],
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Spacer(
            flex: widget.spacerFlexList[3],
          ),
          Expanded(
            flex: widget.itemFlexList[3],
            child: Container(
              color: Colors.pink,
            ),
          ),
          Spacer(
            flex: widget.spacerFlexList[4],
          ),
          Expanded(
            flex: widget.itemFlexList[4],
            child: Container(
              color: Colors.blue,
            ),
          ),
          Spacer(
            flex: widget.spacerFlexList[5],
          ),
        ],
      ),
    );
  }
}
