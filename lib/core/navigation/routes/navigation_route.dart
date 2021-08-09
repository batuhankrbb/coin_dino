import 'package:coin_dino/main.dart';
import 'package:coin_dino/screen_alert/alert_detail_screen.dart';
import 'package:coin_dino/screen_alert/alert_list_screen.dart';
import 'package:coin_dino/screen_detail/coin_detail_screen.dart';
import 'package:coin_dino/screen_in_app_purchase/inapp_purchase_screen.dart';

import '../../../global/components/selection_page/selection_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_route.freezed.dart';

@freezed
class NavigationRoute with _$NavigationRoute {
  const factory NavigationRoute.toSelectionPage(SelectionPage selectionPage) =
      RouteSelectionPage;
  const factory NavigationRoute.toDetails(CoinDetailScreen detailScreen) =
      RouteDetailsPage;
  const factory NavigationRoute.toAlert(AlertDetailScreen alertDetailScreen) =
      RouteAlertPage;
  const factory NavigationRoute.toAlertList(AlertListScreen alertListScreen) =
      RouteAlertListPage;
  const factory NavigationRoute.toInAppPurchase(
      InAppPurchase inAppPurchaseScreen) = RouteInAppPurchase;
  const factory NavigationRoute.toHomePage(HomePage homePage) = RouteHomePage;
}

extension MultiNavigation on NavigationRoute {
  String get rawValue {
    return this.when(
        toSelectionPage: (_) => "selectionPage",
        toDetails: (_) => "detailsPage",
        toAlert: (_) => "alertPage",
        toAlertList: (_) => "alertListPage",
        toInAppPurchase: (_) => "inAppPurchasePage",toHomePage: (_) => "homePage");
  }
}
