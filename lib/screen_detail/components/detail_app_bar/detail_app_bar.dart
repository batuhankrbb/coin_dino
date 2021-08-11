import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/global/components/cashed_network_image_component.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'detail_app_bar_actions.dart';

AppBar detailAppBar(
    {required BuildContext context,
    required String coinTitle,
    required String coinImageURL,
    required String coinSymbol,
    required TabController tabController,
    required Function(int index) onTap}) {
  return AppBar(
    bottom: buildBottomTabBar(context, tabController, onTap),
    actions: [
      DetailAppBarActions(),
    ],
    title: buildAppBarTitle(coinImageURL, context, coinTitle, coinSymbol),
    centerTitle: false,
  );
}

Row buildAppBarTitle(String coinImageURL, BuildContext context,
    String coinTitle, String coinSymbol) {
  return Row(
    children: [
      Flexible(
        flex: 20,
        child: CashedNetworkImageWidget(
          imageURL: coinImageURL,
          imageHeigth: context.getWidth(0.06),
          imageWidth: context.getWidth(0.06),
        ),
      ),
      Spacer(flex: 1),
      Flexible(
        flex: 25,
        child: buildTitleText(coinTitle, coinSymbol, context),
      ),
    ],
  );
}

AutoSizeText buildTitleText(
    String coinTitle, String coinSymbol, BuildContext context) {
  return AutoSizeText(
    coinTitle + coinSymbol,
    style: TextStyle(
      fontSize: context.getWidth(0.04),
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    maxLines: 2,
  );
}

TabBar buildBottomTabBar(
    BuildContext context, TabController tabController, onTap(int index)) {
  return TabBar(
    controller: tabController,
    tabs: [
      Tab(
        icon: Icon(
          Icons.bar_chart,
          color: tabController.index == 0 ? Colors.green : Colors.grey,
          size: context.getHeight(0.033),
        ),
      ),
      Tab(
        icon: Icon(
          Icons.info,
          color: tabController.index == 1 ? Colors.green : Colors.grey,
          size: context.getHeight(0.033),
        ),
      ),
    ],
    onTap: onTap,
    indicatorColor: Colors.green,
  );
}
