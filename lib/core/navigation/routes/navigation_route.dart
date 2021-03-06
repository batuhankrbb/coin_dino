import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../global/components/selection_page/selection_page.dart';
import '../../../screen_alert_detail/alert_detail_screen.dart';
import '../../../screen_alert_list/alert_list_screen.dart';
import '../../../screen_detail/coin_detail_screen.dart';
import '../../../screen_in_app_purchase/inapp_purchase_screen.dart';
import '../../../screen_search/search_screen_main.dart';
import '../../../xscreen_main/main_screen.dart';

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
      InAppPurchaseScreen inAppPurchaseScreen) = RouteInAppPurchase;
  const factory NavigationRoute.toMainScreen(MainScreen mainScreen) =
      RouteMainScreen;
  const factory NavigationRoute.toSearchScreenMain(
      SearchScreenMain searchScreenMain) = RouteSearchScreenMain;
}

extension MultiNavigation on NavigationRoute {
  String get rawValue {
    return this.when(
        toSelectionPage: (_) => "selectionPage",
        toDetails: (_) => "detailsPage",
        toAlert: (_) => "alertPage",
        toAlertList: (_) => "alertListPage",
        toInAppPurchase: (_) => "inAppPurchasePage",
        toMainScreen: (_) => "homePage",
        toSearchScreenMain: (_) => "searchScreenMain");
  }
}
