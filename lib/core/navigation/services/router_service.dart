import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../routes/navigation_routes.dart';

class RouterService {
  static Route<dynamic> generateCustomRoute(RouteSettings settings) {
    NavigationRoute route = settings.arguments as NavigationRoute;

    return route.when(
      unknown: () => _convertToRoute(Text("unknown"))
    );
  }

  static CupertinoPageRoute _convertToRoute(Widget page) {
    return CupertinoPageRoute(builder: (_) => page);
  }
}
