import 'package:coin_dino/global/components/selection_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_route.freezed.dart';

@freezed
class NavigationRoute with _$NavigationRoute {
  const factory NavigationRoute.toSelectionPage(SelectionPage selectionPage) =
    RouteSelectionPage;
}

extension MultiNavigation on NavigationRoute {
  String get rawValue {
    return this.when(toSelectionPage: (_) => "selectionPage");
  }
}
