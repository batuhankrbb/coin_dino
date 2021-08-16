import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/screen_search/search_screen_main.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

AppBar alertListAppBar(BuildContext context) => customAppBar(
        context: context,
        title: "Alerts",
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
