import 'package:coin_dino/core/user_interface/responsive_layout/utils/screen_information_model.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';


class SelectionPage extends StatefulWidget {
  SelectionPage({
    Key? key,
    required this.title,
    required this.dataList,
    required this.isListingActive,
    required this.onSelect,
    required this.selectedIndex,
  }) : super(key: key);

  final String title;
  final List<String> dataList;
  int selectedIndex;
  final bool isListingActive;
  final Function(int index) onSelect;

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildSelectionPageCell(index);
              },
              separatorBuilder: (context, index) {
                return buildSeperator();
              },
              itemCount: widget.dataList.length),
        ),
      ),
    );
  }

  Widget buildSeperator() {
    return Divider();
  }

  SelectionPageCell buildSelectionPageCell(int index) {
    return SelectionPageCell(
      text: widget.dataList[index],
      isSelected: index == widget.selectedIndex,
      onTap: () {
        setState(() {
          widget.selectedIndex = index;
        });
        widget.onSelect(index);
      },
    );
  }
}

class SelectionPageCell extends StatelessWidget {
  SelectionPageCell(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return GestureDetector(
        onTap: onTap,
        child: buildContainer(screenInfo),
      );
    });
  }

  Container buildContainer(ScreenInformation screenInfo) {
    return Container(
      height: screenInfo.screenSize.height * 0.05,
      margin: EdgeInsets.only(left: 6, top: 3, bottom: 3, right: 6),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 85,
            child: buildCustomAutoSizeText(),
          ),
          Expanded(
            flex: 15,
            child: buildIcon(),
          ),
        ],
      ),
    );
  }

  Visibility buildIcon() {
    return Visibility(
      child: Icon(Icons.check),
      visible: isSelected,
    );
  }

  CustomAutoSizeText buildCustomAutoSizeText() {
    return CustomAutoSizeText(
      text: text,
      minFontSize: 14,
      textStyle: TextStyle(
          fontSize: 16,
          color: CustomColor.shared.backgroundDarkModeColor,
          fontWeight: FontWeight.w300),
      maxLines: 1,
    );
  }
}
