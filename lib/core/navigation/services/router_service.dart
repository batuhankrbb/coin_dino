import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../routes/navigation_route.dart';

class RouterService {
  static Route<dynamic> generateCustomRoute(RouteSettings settings) {
    NavigationRoute route = settings.arguments as NavigationRoute;

    return route.when(
      toSelectionPage: (page) {
        return _convertToRoute(page);
      },
      toDetails: (page) {
        return _convertToRoute(page);
      },
      toAlert: (page) {
        return _convertToRoute(page);
      },
      toAlertList: (page) {
        return _convertToRoute(page);
      },
      toInAppPurchase: (page) {
        return _convertToRoute(page);
      },
      toMainScreen: (page) {
        return _convertToRoute(page);
      },
      toSearchScreenMain: (page) {
        return _convertToRoute(page);
      },
    );
  }

  static CupertinoPageRoute _convertToRoute(Widget page) {
    return CupertinoPageRoute(builder: (_) => page);
  }
}
