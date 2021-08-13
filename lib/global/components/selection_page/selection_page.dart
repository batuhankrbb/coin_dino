import '../../../core/navigation/services/navigation_service.dart';
import 'selection_page_text_field.dart';

import '../../../core/extensions/string_extension.dart';
import 'selection_page_cell.dart';
import 'package:flutter/material.dart';

import '../../../core/user_interface/responsive_layout/utils/screen_information_model.dart';
import '../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../utils/custom_colors.dart';
import '../app_bar_components.dart';

class SelectionPage extends StatefulWidget {
  SelectionPage(
      {Key? key,
      required this.title,
      required this.dataList,
      required this.isListingActive,
      required this.onSelect,
      required this.selectedIndex,
      required this.isCapitalActive,
      this.isClosedWhenSelect = false})
      : super(key: key);

  final String title;
  final List<String> dataList;
  int selectedIndex;
  final bool isListingActive;
  final bool isCapitalActive;
  final Function(int index) onSelect;
  final bool isClosedWhenSelect;

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(
          context: context, title: widget.title, showBackButton: true),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Visibility(
                child: Expanded(
                  flex: 13,
                  child: SelectionPageTextField(
                    textEditingController: textEditingController,
                  ),
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
          .startsWith(textEditingController.text.toLowerCase()),
    );
  }

  SelectionPageCell buildSelectionPageCell(int index) {
    return SelectionPageCell(
      text: widget.isCapitalActive
          ? widget.dataList[index].toCapitalCase()
          : widget.dataList[index],
      isSelected: index == widget.selectedIndex,
      isVisible: widget.dataList[index]
          .toLowerCase()
          .startsWith(textEditingController.text.toLowerCase()),
      onTap: () {
        cellOnTap(index);
      },
    );
  }

  void cellOnTap(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
    widget.onSelect(index);
    if (widget.isClosedWhenSelect) {
      NavigationService.shared.goBack();
    }
  }
}
