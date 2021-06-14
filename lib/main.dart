import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/screen_alert/alert_list_screen.dart';
import 'package:coin_dino/screen_detail/coin_detail_screen.dart';
import 'package:coin_dino/screen_search/search_screen.dart';
import 'package:coin_dino/screen_search/search_screen_main.dart';
import 'package:coin_dino/screen_settings/settings_screen.dart';

import 'core/navigation/services/navigation_service.dart';
import 'core/navigation/services/router_service.dart';
import 'core/utils/number_helper.dart';
import 'screen_home/homepage_screen.dart';
import 'screen_onboard/onboard_screen.dart';
import 'screen_search/components/percentage_chip.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'core/hive/hive_helper.dart';
import 'global/app_settings/app_settings_viewmodel.dart';
import 'global/extensions/material_extensions.dart';
import 'global/starting_files/injection_container.dart';
import 'global/starting_files/launch_app.dart';

void main() async {
  await HiveHelper.shared.setUpHive();
  setupGetIt();
  await launchApp();
  await getit.get<AppSettingsViewModel>().setUpSettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppSettingsViewModel appSettingsViewModel =
      getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          navigatorKey: NavigationService.shared.navigatorKey,
          onGenerateRoute: RouterService.generateCustomRoute,
          theme: appSettingsViewModel.themeData,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<Widget> _children = [
    //HomePage(),
    Container(color: Colors.blue[200]),
    Container(color: Colors.green[200]),
    Container(color: Colors.yellow[200]),
    //SettingsScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _children[selectedIndex],
      ),
    );
  }
}
