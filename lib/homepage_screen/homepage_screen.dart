import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';

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
        title: "Coin Track",
        bottom: TabBar(
          tabs: [
            Tab(text: "dasda"),
            Tab(text: "dasda"),
            Tab(text: "dasda"),
          ],
          controller: _tabController,
          indicatorColor: CustomColor.shared.backgroundBlueColor,
          labelColor: Colors.black,
        ),
      ),
      body: Container(
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
    );
  }
}
