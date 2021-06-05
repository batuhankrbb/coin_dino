import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/components/cashed_network_image_component.dart';
import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fl_chart/fl_chart.dart';

import 'components/coin_detail_information_row.dart';
import 'components/coin_detail_screen_header.dart';
import 'components/coin_details_hour_table_widget.dart';

class CoinDetailScreen extends StatefulWidget {
  CoinDetailScreen({Key? key}) : super(key: key);

  @override
  _CoinDetailScreenState createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(),
      body: Container(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 5,
                  child: buildHeader(),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 27,
                  child: buildGraph(),
                ),
                Spacer(flex: 1),
                Expanded(flex: 5, child: coinDetailHoursInformationRowMethod()),
                Spacer(flex: 1),
                Expanded(
                  flex: 15,
                  child: buildInformations(),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildInformations() {
    return Column(
                  children: [
                    CoinDetailInformationRowWidget(
                        title: "24 Saat", price: "10"),
                  ],
                );
  }

  Container buildGraph() {
    return Container(
      color: Colors.grey,
    );
  }

  CoinnDetailScreenHeaderWidget buildHeader() {
    return CoinnDetailScreenHeaderWidget(
        coinName: "Bitcoin",
        coinPrice: "1234231421342314231",
        coinImage: "https://image.pngaaa.com/235/1095235-middle.png");
  }

  Row coinDetailHoursInformationRowMethod() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child:
                CoinDetailHoursTableWidget(tableTitle: "24", tablePrice: "1")),
        Expanded(
            flex: 1,
            child:
                CoinDetailHoursTableWidget(tableTitle: "24", tablePrice: "1")),
      ],
    );
  }
}
