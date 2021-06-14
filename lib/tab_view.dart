import 'package:coin_dino/screen_home/homepage_screen.dart';
import 'package:coin_dino/screen_search/search_screen.dart';
import 'package:flutter/material.dart';

class TabBarViewWidget extends StatefulWidget {
  TabBarViewWidget({Key? key}) : super(key: key);

  @override
  _TabBarViewWidgetState createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        controller: tabController,
        tabs: [
          Tab(text: "1"),
          Tab(text: "2"),
          Tab(text: "3"),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          HomePageScreen(),
          SearchScreen(),
          Center(child: Text("3")),
        ],
      ),
    );
  }
}
