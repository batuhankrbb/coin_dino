import '../../core/navigation/routes/navigation_route.dart';
import '../../core/navigation/services/navigation_service.dart';
import '../../global/components/app_bar_components.dart';

import '../../screen_alert_list/alert_list_screen.dart';
import '../../screen_search/search_screen_main.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customAppBar(
      context: context,
      title: "Home",
      leading: buildLeadingNotificationButton(context),
      action: [
        buildSearchActionButton(context),
      ],
    );
  }

  Widget buildSearchActionButton(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: context.getWidth(0.04)),
        child: Icon(
          Icons.search,
          color: context.colorScheme.primary,
          size: context.getHeight(0.03),
        ),
      ),
      onTap: () {
        NavigationService.shared.navigateTo(
          NavigationRoute.toSearchScreenMain(
            SearchScreenMain(
              showBackButton: true,
            ),
          ),
        );
      },
    );
  }

  Widget buildLeadingNotificationButton(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Icon(
          Icons.notifications,
          color: context.colorScheme.primary,
          size: context.getHeight(0.03),
        ),
      ),
      onTap: () {
        NavigationService.shared.navigateTo(
          NavigationRoute.toAlertList(
            AlertListScreen(),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
