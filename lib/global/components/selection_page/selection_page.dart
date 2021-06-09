import '../../../core/extensions/string_extension.dart';
import 'selection_page_cell.dart';
import 'package:flutter/material.dart';

import '../../../core/user_interface/responsive_layout/utils/screen_information_model.dart';
import '../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../utils/custom_colors.dart';
import '../app_bar_components.dart';
import '../custom_autosize_text.dart';

class SelectionPage extends StatefulWidget {
  SelectionPage({
    Key? key,
    required this.title,
    required this.dataList,
    required this.isListingActive,
    required this.onSelect,
    required this.selectedIndex,
    required this.isCapitalActive,
  }) : super(key: key);

  final String title;
  final List<String> dataList;
  int selectedIndex;
  final bool isListingActive;
  final bool isCapitalActive;
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
      text: widget.isCapitalActive ? widget.dataList[index].toCapitalCase() : widget.dataList[index],
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

