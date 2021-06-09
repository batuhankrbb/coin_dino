import 'package:coin_dino/global/components/cashed_network_image_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../features/details/domain/entity/coin_detail_entity.dart';
import '../global/components/app_bar_components.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'coin_info_screen.dart';
import 'components/coin_chart.dart';
import 'components/coin_detail_information_row.dart';
import 'components/coin_details_hour_table_widget.dart';
import 'viewmodels/detail_screen_view_model.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: buildAppBar(
            coinPrice: "\$${_detailViewModel.appBarCoinPrice}",
            coinTitle: "${_detailViewModel.appBarTitle.toUpperCase()}",
            coinImageURL: "${_detailViewModel.appbarCoinImage}"),
        body: Center(
          child: StateResultBuilder<CoinDetailEntity>(
            stateResult: _detailViewModel.coinDetailResult,
            completedWidget: (data) {
              return TabBarView(
                controller: _tabController,
                children: [
                  completedWidget(data),
                  CoinDetailsInfo(data: data),
                ],
              );
            },
            failureWidget: (failure) {
              return Text("failure");
            },
          ),
        ),
      );
    });
  }

  Widget completedWidget(CoinDetailEntity data) {
    return Container(
      padding: EdgeInsets.all(5),
      child: SingleChildScrollView(
        key: PageStorageKey("detail_scroll"),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 23,
                child: buildGraph(data.id),
              ),
              Spacer(flex: 1),
              Expanded(
                flex: 4,
                child: coinDetailHoursInformationRowMethod(data),
              ),
              Spacer(flex: 1),
              Expanded(
                flex: 30,
                child: buildInformations(data),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Column buildInformations(CoinDetailEntity data) {
    return Column(
      children: [
        CoinDetailInformationRowWidget(
            title: "MARKET CAP RANK", price: data.marketCapRank),
        CoinDetailInformationRowWidget(
            title: "MARKET CAP", price: data.marketCap),
        CoinDetailInformationRowWidget(
            title: "TRADING VOLUME", price: data.tradingVolume),
        CoinDetailInformationRowWidget(
            title: "24H HIGH", price: data.highest24h),
        CoinDetailInformationRowWidget(title: "24H LOW", price: data.lowest24h),
        CoinDetailInformationRowWidget(
            title: "AVAILABLE SUPPLY", price: data.availableSuppy),
        CoinDetailInformationRowWidget(
            title: "TOTAL SUPPLY", price: data.totalSupply),
        CoinDetailInformationRowWidget(
            title: "ALL-TIME HIGH", price: data.allTimeHigh),
        CoinDetailInformationRowWidget(
            title: "SINCE ALL-TIME HIGH", price: data.sinceAllTimeHigh),
        CoinDetailInformationRowWidget(
            title: "ALL-TIME HIGH DATE", price: data.allTimeHighDate),
        CoinDetailInformationRowWidget(
            title: "ALL-TIME LOW", price: data.allTimeLow),
        CoinDetailInformationRowWidget(
            title: "SINCE ALL-TIME LOW", price: data.sinceAllTimeLow),
        CoinDetailInformationRowWidget(
            title: "ALL-TIME LOW DATE", price: data.allTimeLowDate),
      ],
    );
  }

  Widget buildGraph(String coinID) {
    return CoinChart(
      coinID: coinID,
    );
  }

  Row coinDetailHoursInformationRowMethod(CoinDetailEntity data) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "24H", tablePrice: data.priceChange24hTable),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "7D", tablePrice: data.priceChange7dTable),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "14D", tablePrice: data.priceChange14dTable),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "30D", tablePrice: data.priceChange30dTable),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "60D", tablePrice: data.priceChange60dTable),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "1Y", tablePrice: data.priceChange1yTable),
        ),
      ],
    );
  }

  AppBar buildAppBar(
      {required String? coinTitle,
      required String? coinImageURL,
      required String? coinPrice}) {
    return AppBar(
      title: Row(
        children: [
          Flexible(
              flex: 15,
              child: CashedNetworkImageWidget(
                  imageURL: coinImageURL ??
                      "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")),
          Spacer(flex: 1),
          Flexible(
            flex: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coinTitle ?? "Detail",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(coinPrice ?? "0",
                    style: TextStyle(fontSize: 15, color: Colors.black))
              ],
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }
}

/*
 TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            child: Text(
              "Price Chart",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              "Info",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
*/
