import 'package:coin_dino/screen_home/components/home_header_button.dart';
import 'package:flutter/material.dart';

class HomeTableHeader extends StatefulWidget {
  HomeTableHeader({Key? key}) : super(key: key);

  @override
  _HomeTableHeaderState createState() => _HomeTableHeaderState();
}

class _HomeTableHeaderState extends State<HomeTableHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: HomeHeaderButton(text: "#"),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 15,
            child: HomeHeaderButton(text: "Coin"),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 26,
            child: HomeHeaderButton(text: "Price"),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 15,
            child: HomeHeaderButton(text: "7G"),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 30,
            child: HomeHeaderButton(text: "Market Cap"),
          ),
        ],
      ),
    );
  }
}
