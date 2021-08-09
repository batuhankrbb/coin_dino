import 'package:auto_size_text/auto_size_text.dart';
import '../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../core/utils/number_helper.dart';
import '../features/search/domain/entity/search_coin_entity.dart';
import '../global/components/custom_autosize_text.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'search_screen.dart';
import 'trends_screen.dart';
import 'viewmodels/search_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../global/components/app_bar_components.dart';

class SearchScreenMain extends StatefulWidget {
  SearchScreenMain({Key? key}) : super(key: key);

  @override
  _SearchScreenMainState createState() => _SearchScreenMainState();
}

class _SearchScreenMainState extends State<SearchScreenMain>
    with SingleTickerProviderStateMixin {
  var _searchViewModel = getit.get<SearchScreenViewModel>();
  late TabController _tabController;

  @override
  void initState() {
    this._tabController = TabController(length: 2, vsync: this);
    super.initState();
    _searchViewModel.getSearchCoins("");
    _searchViewModel.getAllTrends();
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
    return customAppBar(
      context: context,
      title: _searchViewModel.tabIndex == 0 ? "Search" : "Trends",
      bottom: TabBar(
        indicatorColor: Colors.green,
        onTap: onTapTabBar,
        controller: _tabController,
        tabs: buildTabs(),
      ),
    );
  }

  void onTapTabBar(index) {
    _searchViewModel.tabIndex = index;
  }

  List<Widget> buildTabs() {
    return [
      Tab(
        icon: Icon(
          Icons.search,
          color: _searchViewModel.tabIndex == 0 ? Colors.green : Colors.grey,
        ),
      ),
      Tab(
        icon: Icon(
          Icons.trending_up,
          color: _searchViewModel.tabIndex == 1 ? Colors.green : Colors.grey,
        ),
      ),
    ];
  }
}
