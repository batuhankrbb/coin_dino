import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/components/cashed_network_image_component.dart';
import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fl_chart/fl_chart.dart';

class CoinDetailScreenWidget extends StatefulWidget {
  CoinDetailScreenWidget({Key? key}) : super(key: key);

  @override
  _CoinDetailScreenWidgetState createState() => _CoinDetailScreenWidgetState();
}

class _CoinDetailScreenWidgetState extends State<CoinDetailScreenWidget> {
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
                    child: CoinnDetailScreenHeaderWidget(
                        coinName: "Bitcoin",
                        coinPrice: "2.000097855655",
                        coinImage:
                            "https://image.pngaaa.com/235/1095235-middle.png")),
                Spacer(flex: 1),
                Expanded(flex: 30, child: LineChart(sampleData1())),
                Spacer(flex: 1),
                Expanded(flex: 5, child: coinDetailHoursInformationRowMethod()),
                Spacer(flex: 1),
                Column(
                  children: [
                    CoinDetailDetailInformationWidget(
                        title: "24 Saat", price: "10"),
                    CoinDetailDetailInformationWidget(
                        title: "24 Saat", price: "10"),
                    CoinDetailDetailInformationWidget(
                        title: "24 Saat", price: "10"),
                    CoinDetailDetailInformationWidget(
                        title: "24 Saat", price: "10"),
                    CoinDetailDetailInformationWidget(
                        title: "24 Saat", price: "10"),
                    CoinDetailDetailInformationWidget(
                        title: "24 Saat", price: "10"),
                    CoinDetailDetailInformationWidget(
                        title: "24 Saat", price: "10"),
                  ],
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
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
        Expanded(
            flex: 1,
            child:
                CoinDetailHoursTableWidget(tableTitle: "24", tablePrice: "1")),
        Expanded(
            flex: 1,
            child:
                CoinDetailHoursTableWidget(tableTitle: "24", tablePrice: "1")),
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

class CoinnDetailScreenHeaderWidget extends StatelessWidget {
  final String coinImage;
  final String coinName;
  final String coinPrice;
  CoinnDetailScreenHeaderWidget(
      {Key? key,
      required this.coinImage,
      required this.coinName,
      required this.coinPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 30,
            child: CashedNetworkImageWidget(
              imageWidth: 100,
              imageHeigth: 100,
              imageURL: coinImage,
            )),
        Expanded(
          flex: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                coinName,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxFontSize: 30,
                minFontSize: 20,
              ),
              AutoSizeText(coinPrice),
            ],
          ),
        ),
        Expanded(
            flex: 30,
            child: IconButton(
                icon: Icon(Icons.ios_share),
                onPressed: () {
                  Share.share("dasdad");
                })),
      ],
    );
  }
}

class CoinDetailHoursTableWidget extends StatelessWidget {
  final String tableTitle;
  final String tablePrice;
  CoinDetailHoursTableWidget({
    Key? key,
    required this.tablePrice,
    required this.tableTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration:
          ShapeDecoration(shape: Border.all(color: Colors.grey, width: 0.3)),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  tableTitle,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
                color: CustomColor.shared.backgroundBlueColor,
              )),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center, child: Text(tablePrice))),
        ],
      ),
    );
  }
}

class CoinDetailDetailInformationWidget extends StatelessWidget {
  final String title;
  final String price;
  const CoinDetailDetailInformationWidget(
      {Key? key, required this.price, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(title.toUpperCase(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          AutoSizeText(price.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

LineChartData sampleData1() {
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
      touchCallback: (LineTouchResponse touchResponse) {},
      handleBuiltInTouches: true,
    ),
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        margin: 10,
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'SEPT';
            case 7:
              return 'OCT';
            case 12:
              return 'DEC';
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1m';
            case 2:
              return '2m';
            case 3:
              return '3m';
            case 4:
              return '5m';
          }
          return '';
        },
        margin: 8,
        reservedSize: 30,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(
          color: Color(0xff4e4965),
          width: 4,
        ),
        left: BorderSide(
          color: Colors.transparent,
        ),
        right: BorderSide(
          color: Colors.transparent,
        ),
        top: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    minX: 0,
    maxX: 14,
    maxY: 4,
    minY: 0,
  );
}
