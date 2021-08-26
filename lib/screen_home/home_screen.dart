import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/extensions/context_extensions.dart';
import '../global/starting_files/injection_container.dart';
import 'components/home_screen_app_bar.dart';
import 'components/home_table/home_table.dart';
import 'components/top_chip/home_top_chip_list.dart';
import 'viewmodels/home_screen_view_model.dart';

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
            Spacer(),
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
