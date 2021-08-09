import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/global/components/failure_widget.dart';
import 'package:coin_dino/screen_detail/coin_detail_screen.dart';
import 'package:flutter/cupertino.dart';

import '../features/search/domain/entity/search_trend_entity.dart';
import '../global/components/app_bar_components.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/trend_cell.dart';
import 'viewmodels/search_screen_view_model.dart';

class TrendsScreen extends StatefulWidget {
  TrendsScreen({Key? key}) : super(key: key);

  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  var _searchViewModel = getit.get<SearchScreenViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return StateResultBuilder<SearchTrendEntity>(
          stateResult: _searchViewModel.searchTrendResult,
          completedWidget: (data) {
            return buildCompletedListView(data);
          },
          failureWidget: (failure) {
            return buildFailureWidget();
          },
          initialWidget: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget buildCompletedListView(SearchTrendEntity data) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return buildCell(data, index);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: data.coinEntityList.length,
    );
  }

  Widget buildFailureWidget() {
    return FailureWidget(
      onTryAgain: () {
        _searchViewModel.getAllTrends();
      },
    );
  }

  Widget buildCell(SearchTrendEntity data, int index) {
    return TrendCell(
      searchTrendCoinEntity: data.coinEntityList[index],
      onTap: () {
        NavigationService.shared.navigateTo(
          NavigationRoute.toDetails(
            CoinDetailScreen(coinID: data.coinEntityList[index].id),
          ),
        );
      },
    );
  }
}
