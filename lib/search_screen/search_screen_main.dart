import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/core/utils/number_helper.dart';
import 'package:coin_dino/features/search/domain/entity/search_coin_entity.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/search_screen/components/debouncing_text_field.dart';
import 'package:coin_dino/search_screen/components/search_cell.dart';
import 'package:coin_dino/search_screen/search_screen.dart';
import 'package:coin_dino/search_screen/trends_screen.dart';
import 'package:coin_dino/search_screen/viewmodels/search_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../global/components/app_bar_components.dart';

class SearchScreenMain extends StatefulWidget {
  //TODO SEARCH_SCREEN VE TRENDS_SCREEN İÇİN INITIAL + FAILURE VIEWLERI YAPILACAK
  SearchScreenMain({Key? key}) : super(key: key);

  @override
  _SearchScreenMainState createState() => _SearchScreenMainState();
}

class _SearchScreenMainState extends State<SearchScreenMain>
    with SingleTickerProviderStateMixin {
  var searchViewModel = getit.get<SearchScreenViewModel>();
  late TabController _tabController;

  @override
  void initState() {
    this._tabController = TabController(length: 2, vsync: this);
    super.initState();
    searchViewModel.getSearchCoins("");
    searchViewModel.getAllTrends();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: buildAppBar(),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TabBarView(
                controller: _tabController,
                children: [
                  SearchScreen(),
                  TrendsScreen(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return appbarComponent(
      title: searchViewModel.appBarText,
      bottom: TabBar(
        onTap: (index) {
          searchViewModel.changeAppBarText(index);
        },
        controller: _tabController,
        tabs: [
          Tab(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.trending_up,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
