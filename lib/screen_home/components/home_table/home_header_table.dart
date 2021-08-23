import '../../../features/market/presentation/utils/listing_enums.dart';
import '../../../global/starting_files/injection_container.dart';
import 'home_header_button.dart';
import '../../viewmodels/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';


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
              text: "HOME_SCREEN.HEADER_RANK_TITLE".tr()
            ),
          ),
          Expanded(
            flex: widget.spacerFlexList[1],
            child: VerticalDivider(),
          ),
          Expanded(
            flex: widget.itemFlexList[1],
            child: HomeHeaderButton(
              text: "HOME_SCREEN.HEADER_COIN_TITLE".tr(),
            ),
          ),
          Expanded(
            flex: widget.spacerFlexList[2],
            child: VerticalDivider(),
          ),
          Expanded(
            flex: widget.itemFlexList[2],
            child: HomeHeaderButton(
              text: "HOME_SCREEN.HEADER_PRICE_TITLE".tr(),
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
              text: "HOME_SCREEN.HEADER_MARKETCAP_TITLE".tr(),
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
