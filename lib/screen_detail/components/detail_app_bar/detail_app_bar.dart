import 'package:auto_size_text/auto_size_text.dart';
import '../../../global/components/cached_network_image.dart';
import '../../../global/components/icon_back_button.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';
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
    leading: IconBackButton(),
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
        child: CachedNetworkImageWidget(
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
    coinTitle + " " + coinSymbol,
    style: TextStyle(
      fontSize: context.getWidth(0.04),
      color: context.colorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
    maxLines: 2,
    minFontSize: 10,
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
          color: tabController.index == 0
              ? context.colorScheme.secondary
              : context.colorScheme.background,
          size: context.getHeight(0.033),
        ),
      ),
      Tab(
        icon: Icon(
          Icons.info,
          color: tabController.index == 1
              ? context.colorScheme.secondary
              : context.colorScheme.background,
          size: context.getHeight(0.033),
        ),
      ),
    ],
    onTap: onTap,
    indicatorColor: context.colorScheme.secondary,
  );
}
