import '../../../features/market/presentation/utils/listing_enums.dart';
import '../../../global/starting_files/injection_container.dart';
import 'home_header_button.dart';
import '../../viewmodels/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

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
  var homeScreenViewModel = getit.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(0.06),
      color: context.colorScheme.primaryVariant,
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: widget.itemFlexList[0],
            child: HomeHeaderButton(
              text: "#",
            ),
          ),
          Expanded(
            flex: widget.spacerFlexList[1],
            child: VerticalDivider(),
          ),
          Expanded(
            flex: widget.itemFlexList[1],
            child: HomeHeaderButton(
              text: "Coin",
            ),
          ),
          Expanded(
            flex: widget.spacerFlexList[2],
            child: VerticalDivider(),
          ),
          Expanded(
            flex: widget.itemFlexList[2],
            child: HomeHeaderButton(
              text: "Price",
            ),
          ),
          Expanded(
            flex: widget.spacerFlexList[3],
            child: VerticalDivider(),
          ),
          Expanded(
            flex: widget.itemFlexList[3],
            child: HomeHeaderButton(
              text: homeScreenViewModel.marketDate.displayValue,
            ),
          ),
          Expanded(
            flex: widget.spacerFlexList[4],
            child: VerticalDivider(),
          ),
          Expanded(
            flex: widget.itemFlexList[4],
            child: HomeHeaderButton(
              text: "Market Cap",
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
