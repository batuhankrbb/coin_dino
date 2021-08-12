import 'package:coin_dino/global/components/colored_tab_bar.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/xscreen_main/view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainTabBar extends StatefulWidget {
  MainTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();

  final TabController tabController;
}

class _MainTabBarState extends State<MainTabBar> {
  var viewModel = getit.get<MainScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ColoredTabBar(
        color: context.colorScheme.secondaryVariant,
        tabBar: TabBar(
          controller: widget.tabController,
          onTap: tabBarOnTap,
          indicatorColor: Colors.transparent,
          tabs: buildTabs(),
        ),
      );
    });
  }

  List<Tab> buildTabs() {
    return [
      Tab(
        child: Icon(
          Icons.home,
          color: viewModel.selectedIndex == 0
              ? context.colorScheme.surface
              : context.colorScheme.background,
        ),
      ),
      Tab(
        child: Icon(
          Icons.search,
          color: viewModel.selectedIndex == 1
              ? context.colorScheme.surface
              : context.colorScheme.background,
        ),
      ),
      Tab(
        child: Icon(
          Icons.settings,
          color: viewModel.selectedIndex == 2
              ? context.colorScheme.surface
              : context.colorScheme.background,
        ),
      ),
    ];
  }

  void tabBarOnTap(int index) {
    print(index);
    viewModel.selectedIndex = index;
  }
}
