import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/core/utils/number_helper.dart';
import 'package:coin_dino/features/search/domain/entity/search_coin_entity.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/search_screen/viewmodels/search_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/components/app_bar_components.dart';

//TODO BURADAKİ KODLARI DÜZENLEYECEĞİM.
class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchViewModel = getit.get<SearchScreenViewModel>();

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(title: "Search"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: buildTextField(),
            ),
            Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 50,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text("test");
                },
                itemCount: 10,
              ),
            ),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }

  Container buildTextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: CupertinoTextField(
        controller: textController,
        prefix: Container(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.search),
        ),
        onChanged: (value) {
          searchViewModel.getSearchCoins(value);
        },
      ),
    );
  }
}

class SearchCell extends StatelessWidget {
  SearchCell({Key? key, required this.searchCoinEntity}) : super(key: key);

  final SearchCoinEntity searchCoinEntity;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Container(
        width: screenInfo.screenSize.width * 0.8,
        height: screenInfo.screenSize.height * 0.08,
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              flex: 15,
              child: buildCoinImage(),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 44,
              child: buildCoinText(),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 31,
              child: buildCoinPrice(),
            ),
          ],
        ),
      );
    });
  }

  Container buildCoinImage() {
    return Container(
      color: Colors.red[200],
    );
  }

  Container buildCoinPrice() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomAutoSizeText(
              text:
                  NumberHelper.shared.fixNum(searchCoinEntity.currentPrice, 5),
              textStyle: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(
            child: PercentageChip(
              percentage: searchCoinEntity.priceChangePercentage24h ?? 0,
            ),
          )
        ],
      ),
    );
  }

  Column buildCoinText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomAutoSizeText(
            text: "Bitcoin",
            textStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: CustomAutoSizeText(
            text: "BTC",
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}

class PercentageChip extends StatelessWidget {
  PercentageChip({Key? key, required this.percentage}) : super(key: key);

  final num percentage;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Container(
        width: screenInfo.screenSize.width * 0.13,
        height: screenInfo.screenSize.height * 0.08,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: percentage < 0 ? Colors.red : Colors.green,
            borderRadius: BorderRadius.circular(12)),
        child: AutoSizeText(
          giveFormattedText(),
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    });
  }

  String giveFormattedText() {
    return (percentage < 0 ? "" : "+") +
        NumberHelper.shared.fixNum(percentage, 2);
  }
}
