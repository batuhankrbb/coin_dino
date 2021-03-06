import '../core/mobile_ads/admob_ad_id_helper.dart';
import '../core/mobile_ads/admob_helper.dart';
import '../global/components/loading_screen.dart';

import '../core/error_handling/custom_failure.dart';
import '../core/navigation/routes/navigation_route.dart';
import '../core/navigation/services/navigation_service.dart';
import '../global/components/cached_network_image.dart';
import '../global/components/failure_widget.dart';
import '../screen_alert_detail/alert_detail_screen.dart';
import 'components/completed_widget/coin_detail_completed_widget.dart';
import 'components/detail_app_bar/detail_app_bar.dart';
import 'components/detail_app_bar/detail_app_bar_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../features/details/domain/entity/coin_detail_entity.dart';
import '../global/components/app_bar_components.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'coin_info_screen.dart';
import 'components/coin_chart/coin_chart.dart';
import 'components/coin_detail_information_row.dart';
import 'components/coin_details_hour_table_widget.dart';
import 'viewmodels/detail_screen_view_model.dart';
import '../core/extensions/context_extensions.dart';

class CoinDetailScreen extends StatefulWidget {
  CoinDetailScreen({Key? key, required this.coinID}) : super(key: key);

  @override
  _CoinDetailScreenState createState() => _CoinDetailScreenState();

  String coinID;
}

class _CoinDetailScreenState extends State<CoinDetailScreen>
    with SingleTickerProviderStateMixin {
  var _detailViewModel = getit.get<DetailScreenViewModel>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _detailViewModel.getCoinDetails(widget.coinID);
    _detailViewModel.getCharts(coinID: widget.coinID, days: "7");
    _detailViewModel.setContext(context);
    AdmobHelper.shared.showInterstitialAd(
        interstitialID: AdmobIDHelper.shared.coinDetailScreenInterstitialID,
        onAdFailed: (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: context.colorScheme.onSurface,
        appBar: buildAppBar(),
        body: Center(
          child: StateResultBuilder<CoinDetailEntity>(
            stateResult: _detailViewModel.coinDetailResult,
            completedWidget: buildCompletedWidget,
            failureWidget: buildFailureWidget,
            initialWidget: LoadingScreen(),
          ),
        ),
      );
    });
  }

  Widget buildCompletedWidget(CoinDetailEntity data) {
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        CoinDetailCompletedWidget(data: data),
        CoinDetailsInfo(data: data),
      ],
    );
  }

  Widget buildFailureWidget(CustomFailure failure) {
    return FailureWidget(
      onTryAgain: () {
        _detailViewModel.getCoinDetails(widget.coinID);
        _detailViewModel.getCharts(coinID: widget.coinID, days: "7");
      },
    );
  }

  AppBar buildAppBar() {
    return detailAppBar(
        context: context,
        coinTitle: _detailViewModel.appBarTitle,
        coinImageURL: _detailViewModel.appbarCoinImage,
        coinSymbol: _detailViewModel.appBarSymbol,
        tabController: _tabController,
        onTap: (index) {
          setState(() {});
        });
  }
}
