import 'package:coin_dino/screen_detail/coin_detail_screen.dart';

import '../../../global/components/selection_page/selection_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_route.freezed.dart';

@freezed
class NavigationRoute with _$NavigationRoute {
  const factory NavigationRoute.toSelectionPage(SelectionPage selectionPage) =
    RouteSelectionPage;
    const factory NavigationRoute.toDetails(CoinDetailScreen detailScreen) =
    RouteDetailsPage;
}

extension MultiNavigation on NavigationRoute {
  String get rawValue {
    return this.when(toSelectionPage: (_) => "selectionPage",toDetails: (_) => "detailsPage");
  }
}
