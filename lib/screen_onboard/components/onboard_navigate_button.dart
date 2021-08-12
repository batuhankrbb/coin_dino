import '../../core/navigation/routes/navigation_route.dart';
import '../../core/navigation/services/navigation_service.dart';
import '../../global/utils/custom_colors.dart';
import '../../main.dart';
import '../../main_screen.dart';
import '../../screen_home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import '../../global/extensions/style_extensions.dart';

class OnboardNavigateButton extends StatelessWidget {
  const OnboardNavigateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(0.15),
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: () {
          NavigationService.shared
              .navigateTo(NavigationRoute.toMainScreen(MainScreen()));
        },
        child: ElevatedButton(
          child: Icon(
            Icons.arrow_right_alt,
            color: context.colorScheme.onSurface,
            size: context.getWidth(0.08),
          ),
          onPressed: null,
          style: context.buttonStyle(
            backgroundColor: context.colorScheme.secondary,
            shadowColor: context.colorScheme.secondary,
            elevation: 12,
          ),
        ),
      ),
    );
  }
}
