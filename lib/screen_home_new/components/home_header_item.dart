import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/features/details/data/models/coin_detail_model.dart';
import 'package:flutter/material.dart';

class HomeHeaderItem extends StatefulWidget {
  HomeHeaderItem({Key? key, required this.text}) : super(key: key);

  @override
  _HomeHeaderItemState createState() => _HomeHeaderItemState();

  final String text;
}

class _HomeHeaderItemState extends State<HomeHeaderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [AutoSizeText(widget.text)],
      ),
    );
  }
}
