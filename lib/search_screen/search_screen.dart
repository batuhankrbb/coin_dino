import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/core/utils/number_helper.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
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
                  return SearchCell();
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
          //todo buraya istek vmden
        },
      ),
    );
  }
}

class SearchCell extends StatelessWidget {
  const SearchCell({Key? key}) : super(key: key);

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
              child: Container(
                color: Colors.red[200],
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 44,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomAutoSizeText(
                      text: "Bitcoin",
                      textStyle:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: CustomAutoSizeText(
                      text: "BTC",
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 31,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomAutoSizeText(
                        text: "0.51521",
                        textStyle: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: PercentageChip(
                        percentage: -0.20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class PercentageChip extends StatelessWidget {
  PercentageChip({Key? key, required this.percentage}) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: percentage < 0 ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(12)),
      child: AutoSizeText(
        giveFormattedText(),
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  String giveFormattedText() {
    return (percentage < 0 ? "" : "+") +
        NumberHelper.shared.fixDouble(percentage, 2);
  }
}

/*
CustomAutoSizeText(
              text: "Search coins that you are interested in",
              textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              maxLines: 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: CupertinoTextField(
                controller: textController,
                prefix: Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.search),
                ),
                onChanged: (value) {
                  //todo buraya istek vmden
                },
              ),
            )
 */

// https://dribbble.com/shots/11668109-Cryptocurrency-iOS-app-Dark-Version
