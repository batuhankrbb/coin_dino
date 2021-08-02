import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CoinDetailInformationRowWidget extends StatelessWidget {
  final String title;
  final String price;
  const CoinDetailInformationRowWidget(
      {Key? key, required this.price, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: AutoSizeText(title,
                  style: TextStyle(color: Colors.grey, fontSize: 14))),
          Expanded(
              child: AutoSizeText(
            price.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            textAlign: TextAlign.end,
          )),
        ],
      ),
    );
  }
}
