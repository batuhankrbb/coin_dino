import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/screen_home_new/components/home_coin_cell.dart';
import 'package:coin_dino/screen_home_new/components/home_table_header.dart';
import 'package:flutter/material.dart';

class HomeScreenNew extends StatefulWidget {
  HomeScreenNew({Key? key}) : super(key: key);

  @override
  _HomeScreenNewState createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(title: "Home"),
      body: Container(
        alignment: Alignment.center,
        child: HomeTableHeader(),
      ),
    );
  }
}
