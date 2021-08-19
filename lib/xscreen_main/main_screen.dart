import '../global/components/colored_tab_bar.dart';
import '../screen_home/home_screen.dart';
import '../screen_search/search_screen_main.dart';
import '../screen_settings/settings_screen.dart';
import 'components/main_tab_bar.dart';
import 'package:flutter/material.dart';
import '../core/extensions/context_extensions.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SafeArea(
        child: MainTabBar(tabController: tabController),
      ),
      backgroundColor: context.colorScheme.secondaryVariant,
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          SearchScreenMain(
            key: PageStorageKey("search"),
          ),
          SettingsScreen(
            key: PageStorageKey("settings"),
          ),
        ],
      ),
    );
  }
}
