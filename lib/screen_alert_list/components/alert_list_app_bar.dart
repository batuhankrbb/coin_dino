import '../../core/navigation/routes/navigation_route.dart';
import '../../core/navigation/services/navigation_service.dart';
import '../../global/components/app_bar_components.dart';
import '../../screen_search/search_screen_main.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
AppBar alertListAppBar(BuildContext context) => customAppBar(
        context: context,
        title: "ALERT_LIST_SCREEN_APP_BAR_TITLE".tr(),
        showBackButton: true,
        action: [
          Container(
            padding: EdgeInsets.only(right: context.getWidth(0.03)),
            child: GestureDetector(
              onTap: () {
                NavigationService.shared.navigateTo(
                    NavigationRoute.toSearchScreenMain(SearchScreenMain(
                  showBackButton: true,
                )));
              },
              child: Icon(
                Icons.add,
                color: context.colorScheme.primary,
                size: context.getHeight(0.04),
              ),
            ),
          )
        ]);
