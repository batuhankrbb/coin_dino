import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_home/components/home_table_header.dart';
import 'package:coin_dino/screen_home/components/home_top_chip_list.dart';
import 'package:coin_dino/screen_home/components/top_home_chip.dart';
import 'package:coin_dino/screen_home/viewmodels/home_screen_view_model.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var homeScreenViewModel = getit.get<HomeScreenViewModel>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(title: "Home"),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: HomeTopChipList(),
            ),
            Spacer(),
            Expanded(
              flex: 8,
              child: HomeTableHeader(),
            ),
            Expanded(
              flex: 90,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
