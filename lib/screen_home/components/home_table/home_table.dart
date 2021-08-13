import '../../../core/error_handling/custom_failure.dart';
import '../../../core/navigation/routes/navigation_route.dart';
import '../../../core/navigation/services/navigation_service.dart';
import '../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../features/market/domain/entities/market_coin_entity.dart';
import '../../../global/components/failure_widget.dart';
import '../../../global/components/state_result_builder.dart';
import '../../../global/starting_files/injection_container.dart';
import '../../../screen_detail/coin_detail_screen.dart';
import 'home_header_table.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../viewmodels/home_screen_view_model.dart';
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
      homeScreenViewModel.getAllCategories();
    });
  }

  Widget buildCompletedWidget(List<MarketCoinEntity> data) {
    return Observer(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 25,
            child: ListView.separated(
              itemBuilder: buildCell,
              separatorBuilder: buildSeparator,
              itemCount: homeScreenViewModel.coinListToShow.length,
              controller: homeScreenViewModel.scrollController,
              physics: BouncingScrollPhysics(),
            ),
          ),
          if (homeScreenViewModel.isScrolled) CupertinoActivityIndicator(),
        ],
      );
    });
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
            onTap: () {
              cellOnTap(homeScreenViewModel.coinListToShow[index]);
            },
          )
        ],
      );
    }
    return HomePageCell(
      data: homeScreenViewModel.coinListToShow[index],
      itemFlexList: itemFlexList,
      spacerFlexList: spacerFlexList,
      onTap: () {
        cellOnTap(homeScreenViewModel.coinListToShow[index]);
      },
    );
  }

  Widget buildSeparator(BuildContext context, int index) {
    return Divider();
  }

  void cellOnTap(MarketCoinEntity data) {
    NavigationService.shared.navigateTo(
        NavigationRoute.toDetails(CoinDetailScreen(coinID: data.id)));
  }
}
