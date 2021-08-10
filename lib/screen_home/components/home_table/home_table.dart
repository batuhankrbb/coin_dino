import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';
import 'package:coin_dino/global/components/failure_widget.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_home/components/home_table/home_header_table.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'package:coin_dino/screen_home/viewmodels/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'home_page_cell.dart';

class HomeTable extends StatefulWidget {
  HomeTable({Key? key}) : super(key: key);

  @override
  _HomeTableState createState() => _HomeTableState();
}

class _HomeTableState extends State<HomeTable> {
  var homeScreenViewModel = getit.get<HomeScreenViewModel>();

  var itemFlexList = [10, 15, 28, 15, 32];
  var spacerFlexList = [1, 2, 2, 3, 2, 1];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) {
          return StateResultBuilder<List<MarketCoinEntity>>(
            stateResult: homeScreenViewModel.coinListResult,
            initialWidget: CupertinoActivityIndicator(),
            completedWidget: buildCompletedWidget,
            failureWidget: buildFailureWidget,
          );
        },
      ),
    );
  }

  Widget buildFailureWidget(CustomFailure failure) {
    return FailureWidget(onTryAgain: () {
      homeScreenViewModel.getCoinList();
    });
  }

  Widget buildCompletedWidget(List<MarketCoinEntity> data) {
    return ListView.separated(
      itemBuilder: buildCell,
      separatorBuilder: buildSeparator,
      itemCount: homeScreenViewModel.coinListToShow.length,
    );
  }

  Widget buildCell(BuildContext context, int index) {
    if (index == 0) {
      return Column(
        children: [
          HomeTableHeader(
            itemFlexList: itemFlexList,
            spacerFlexList: spacerFlexList,
          ),
          HomePageCell(
            data: homeScreenViewModel.coinListToShow[index],
            itemFlexList: itemFlexList,
            spacerFlexList: spacerFlexList,
          )
        ],
      );
    }
    return HomePageCell(
      data: homeScreenViewModel.coinListToShow[index],
      itemFlexList: itemFlexList,
      spacerFlexList: spacerFlexList,
    );
  }

  Widget buildSeparator(BuildContext context, int index) {
    return Divider();
  }
}
