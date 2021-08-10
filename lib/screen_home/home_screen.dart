import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/components/failure_widget.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_home/components/home_table/home_page_cell.dart';
import 'package:coin_dino/screen_home/components/home_table/home_header_table.dart';
import 'package:coin_dino/screen_home/components/home_table/home_table.dart';
import 'package:coin_dino/screen_home/components/top_chip/home_top_chip_list.dart';
import 'package:coin_dino/screen_home/components/top_chip/top_home_chip.dart';
import 'package:coin_dino/screen_home/viewmodels/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

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
    homeScreenViewModel.setUpReactions();
    homeScreenViewModel.getCoinList();
    homeScreenViewModel.scrollController.addListener(() {
      if (homeScreenViewModel.scrollController.offset >=
              homeScreenViewModel.scrollController.position.maxScrollExtent &&
          !homeScreenViewModel.scrollController.position.outOfRange) {
        homeScreenViewModel.getCoinListNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    homeScreenViewModel.disposeReactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Home"),
      backgroundColor: context.colorScheme.onSurface,
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
              flex: 90,
              child: HomeTable(),
            ),
          ],
        ),
      ),
    );
  }
}
