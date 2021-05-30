import 'package:flutter/material.dart';

import '../global/components/app_bar_components.dart';
import '../global/utils/custom_colors.dart';
import 'cyrpto_currency_screen/cyrpyo_currency_screen.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(
          title: "Coin Track", bottom: homePageTabBarItemMethod()),
      body: homepageTabBarViewMethod(),
    );
  }

// * Anasayfa Tab Bar item Methodu
  TabBarView homepageTabBarViewMethod() {
    return TabBarView(controller: _tabController, children: [
      CyrptoCurrencyScreen(),
      Container(color: Colors.green),
      Container(color: Colors.amber),
    ]);
  }

// * Anasayfa Kategori Methodu
  TabBar homePageTabBarItemMethod() {
    return TabBar(
      tabs: [
        Tab(text: "CyrptoCurrency"),
        Tab(text: "NFT"),
        Tab(text: "Falan Filan"),
      ],
      controller: _tabController,
      indicatorColor: CustomColor.shared.backgroundBlueColor,
      labelColor: Colors.black,
    );
  }
}
/*
Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(flex: 8, child: Container(color: Colors.red)),
            Spacer(flex: 2),
            Expanded(flex: 8, child: Container(color: Colors.red)),
            Spacer(flex: 2),
            Expanded(flex: 80, child: Container(color: Colors.red)),
          ],
        ),
      ),
      */