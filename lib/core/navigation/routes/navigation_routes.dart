import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_routes.freezed.dart';

@freezed
class NavigationRoute with _$NavigationRoute {
  const factory NavigationRoute.unknown() = Unknown;
}

extension MultiNavigation on NavigationRoute {
  String get rawValue {
    return this.when(unknown: () => "unknown");
  }
}
