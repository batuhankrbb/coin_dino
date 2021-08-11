import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/global/components/selection_page/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class TopHomeChip extends StatefulWidget {
  TopHomeChip(
      {Key? key,
      required this.texts,
      required this.selectedIndex,
      required this.onTap,
      required this.title,
      this.isBarActive = false})
      : super(key: key);

  @override
  _TopHomeChipState createState() => _TopHomeChipState();

  List<String> texts;
  int selectedIndex;
  Function(int index) onTap;
  String title;
  bool isBarActive;
}

class _TopHomeChipState extends State<TopHomeChip> {
  var selected = 0;

  @override
  void initState() {
    super.initState();
    selected = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToSelection,
      child: Container(
        padding: EdgeInsets.only(left: 4),
        margin: EdgeInsets.symmetric(horizontal: context.getWidth(0.025)),
        height: context.getHeight(0.04),
        decoration: buildDecoration(context),
        child: buildChild(context),
      ),
    );
  }

  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: Colors.green[400],
      borderRadius: BorderRadius.circular(6),
    );
  }

  Row buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 10,
          child: buildText(context),
        ),
        Flexible(
          flex: 4,
          child: buildIcon(context),
        ),
      ],
    );
  }

  Icon buildIcon(BuildContext context) {
    return Icon(
      Icons.arrow_drop_down,
      color: Colors.white,
      size: context.getWidth(0.06),
    );
  }

  Container buildText(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.getWidth(0.006)),
      child: AutoSizeText(
        widget.texts[selected],
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: context.getWidth(0.05),
        ),
        textAlign: TextAlign.center,
        minFontSize: 8,
      ),
    );
  }

  void navigateToSelection() {
    NavigationService.shared.navigateTo(
      NavigationRoute.toSelectionPage(
        SelectionPage(
          dataList: widget.texts,
          title: widget.title,
          isListingActive: widget.isBarActive,
          isClosedWhenSelect: true,
          onSelect: (index) {
            setState(() {
              selected = index;
            });
            widget.onTap(index);
          },
          selectedIndex: selected,
          isCapitalActive: false,
        ),
      ),
    );
  }
}
