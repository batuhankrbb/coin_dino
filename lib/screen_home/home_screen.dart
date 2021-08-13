import 'package:coin_dino/screen_home/components/home_screen_app_bar.dart';

import '../features/market/domain/entities/market_coin_entity.dart';
import '../global/components/app_bar_components.dart';
import '../global/components/failure_widget.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'components/home_table/home_page_cell.dart';
import 'components/home_table/home_header_table.dart';
import 'components/home_table/home_table.dart';
import 'components/top_chip/home_top_chip_list.dart';
import 'components/top_chip/top_home_chip.dart';
import 'viewmodels/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../core/extensions/context_extensions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  var homeScreenViewModel = getit.get<HomeScreenViewModel>();

  @override
  void initState() {
    super.initState();
    homeScreenViewModel.setUpViewModel();
    homeScreenViewModel.scrollController.addListener(() {
      if (homeScreenViewModel.scrollController.offset >=
              homeScreenViewModel.scrollController.position.maxScrollExtent &&
          !homeScreenViewModel.scrollController.position.outOfRange) {
        homeScreenViewModel.getCoinListNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
      backgroundColor: context.colorScheme.onSurface,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 5,
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

  @override
  bool get wantKeepAlive => true;
}
