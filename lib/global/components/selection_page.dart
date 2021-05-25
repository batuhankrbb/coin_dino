import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';


//TODO DEVAM EDİLECEK

class SelectionPage<T> extends StatelessWidget {
  SelectionPage(
      {Key? key,
      required this.title,
      required this.dataList,
      required this.isListingActive})
      : super(key: key);

  String title;
  List<String> dataList;
  bool isListingActive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SelectionPageCell(text: dataList[index],isSelected: false,);
          },
          itemCount: dataList.length,
        ),
      ),
    );
  }
}

class SelectionPageCell extends StatelessWidget {
  SelectionPageCell({Key? key, required this.text, required this.isSelected}) : super(key: key);

  String text;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 30, color: CustomColor.shared.backgroundBlueColor),
      ),
    );
  }
}
