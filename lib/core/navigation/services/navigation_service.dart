import 'package:flutter/widgets.dart';

import '../routes/navigation_route.dart';

class NavigationService {
  static NavigationService shared = NavigationService();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(NavigationRoute route) {
    if (navigatorKey.currentState == null) {
      return null;
    }
    return navigatorKey.currentState!
        .pushNamed(route.rawValue, arguments: route);
  }

  Future<dynamic>? navigateAndReplaceTo(NavigationRoute route) {
    if (navigatorKey.currentState == null) {
      return null;
    }
    return navigatorKey.currentState!
        .pushReplacementNamed(route.rawValue, arguments: route);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
  }
}
