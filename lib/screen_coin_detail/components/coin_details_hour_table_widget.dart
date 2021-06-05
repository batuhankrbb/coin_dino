import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';

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