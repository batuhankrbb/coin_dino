import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return SelectionPageCell(
                  text: dataList[index],
                  isSelected: false,
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  color: CustomColor.shared.backgroundDarkModeColor,
                );
              },
              itemCount: dataList.length),
        ),
      ),
    );
  }
}

class SelectionPageCell extends StatelessWidget {
  SelectionPageCell({Key? key, required this.text, required this.isSelected})
      : super(key: key);

  String text;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Container(
        height: screenInfo.screenSize.height * 0.06,
        margin: EdgeInsets.only(left: 6, top: 3, bottom: 3, right: 6),
        alignment: Alignment.centerLeft,
        child: CustomAutoSizeText(
          text: text,
          minFontSize: 14,
          textStyle: TextStyle(
              fontSize: 16,
              color: CustomColor.shared.backgroundDarkModeColor,
              fontWeight: FontWeight.w300),
          maxLines: 1,
        ),
      );
    });
  }
}
