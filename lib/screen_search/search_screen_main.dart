import 'package:auto_size_text/auto_size_text.dart';
import '../global/components/colored_tab_bar.dart';
import '../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../core/utils/number_helper.dart';
import '../features/search/domain/entity/search_coin_entity.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'search_screen.dart';
import 'trends_screen.dart';
import 'viewmodels/search_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../core/extensions/context_extensions.dart';
import '../global/components/app_bar_components.dart';

class SearchScreenMain extends StatefulWidget {
  SearchScreenMain({Key? key}) : super(key: key);

  @override
  _SearchScreenMainState createState() => _SearchScreenMainState();
}

class _SearchScreenMainState extends State<SearchScreenMain>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  var _searchViewModel = getit.get<SearchScreenViewModel>();
  late TabController _tabController;

  @override
  void initState() {
    this._tabController = TabController(length: 2, vsync: this);
    super.initState();
    _searchViewModel.setUpViewModel();
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
        return Container(
          decoration: buildGradientDecoration(context),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
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
          ),
        );
      },
    );
  }

  BoxDecoration buildGradientDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        context.colorScheme.primaryVariant,
        context.colorScheme.onSurface,
        context.colorScheme.onSurface,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    );
  }

  AppBar buildAppBar() {
    return customAppBar(
      context: context,
      title: _searchViewModel.tabIndex == 0 ? "Search" : "Trends",
      backgroundColor: context.colorScheme.primaryVariant,
      bottom: buildTabBar(),
    );
  }

  void onTapTabBar(index) {
    _searchViewModel.tabIndex = index;
  }

  ColoredTabBar buildTabBar() {
    return ColoredTabBar(
      color: context.colorScheme.primaryVariant,
      tabBar: TabBar(
        indicatorColor: Colors.transparent,
        onTap: onTapTabBar,
        controller: _tabController,
        tabs: [
          Tab(
            icon: Icon(
              Icons.search,
              color: _searchViewModel.tabIndex == 0
                  ? context.colorScheme.surface
                  : context.colorScheme.background,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.trending_up,
              color: _searchViewModel.tabIndex == 1
                  ? context.colorScheme.surface
                  : context.colorScheme.background,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
