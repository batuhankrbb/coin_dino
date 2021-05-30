import 'package:flutter/material.dart';

import '../../core/user_interface/responsive_layout/utils/screen_information_model.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../utils/custom_colors.dart';
import 'app_bar_components.dart';
import 'custom_autosize_text.dart';

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
  TextEditingController textController = TextEditingController();
  String filterText = "";
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbarComponent(title: widget.title),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Visibility(
                child: Expanded(
                  flex: 13,
                  child: buildCustomTextField(),
                ),
                visible: widget.isListingActive),
            Expanded(
              flex: 87,
              child: buildListViewSeperated(),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCustomTextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey,
      child: Container(
        color: CustomColor.shared.backgroundWhiteColor,
        child: buildTextFieldRow(),
      ),
    );
  }

  Row buildTextFieldRow() {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Icon(Icons.search),
        ),
        Expanded(
          flex: 70,
          child: buildTextField(),
        ),
        Expanded(
          flex: 20,
          child: buildCancelButtonForTextfield(),
        )
      ],
    );
  }

  Visibility buildCancelButtonForTextfield() {
    return Visibility(
        child: TextButton(
          onPressed: () {
            focusNode.unfocus();
            textController.clear();
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
        ),
        visible: focusNode.hasFocus);
  }

  TextField buildTextField() {
    return TextField(
      focusNode: focusNode,
      controller: textController,
      onChanged: (data) {
        setState(() {
          filterText = data;
        });
      },
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      cursorColor: Colors.black,
    );
  }

  Widget buildListViewSeperated() {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildSelectionPageCell(index);
          },
          separatorBuilder: (context, index) {
            return buildSeperator(index);
          },
          itemCount: widget.dataList.length),
    );
  }

  Widget buildSeperator(int index) {
    return Visibility(
      child: Divider(),
      visible: widget.dataList[index]
          .toLowerCase()
          .startsWith(filterText.toLowerCase()),
    );
  }

  SelectionPageCell buildSelectionPageCell(int index) {
    return SelectionPageCell(
      text: widget.dataList[index],
      isSelected: index == widget.selectedIndex,
      isVisible: widget.dataList[index]
          .toLowerCase()
          .startsWith(filterText.toLowerCase()),
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
      required this.onTap,
      required this.isVisible})
      : super(key: key);

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  bool isVisible;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Visibility(
        visible: isVisible,
        child: GestureDetector(
          onTap: onTap,
          child: buildContainer(screenInfo),
        ),
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
