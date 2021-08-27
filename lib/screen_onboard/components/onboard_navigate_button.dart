import '../../global/app_settings/app_settings_viewmodel.dart';
import '../../global/starting_files/injection_container.dart';

import '../../core/navigation/routes/navigation_route.dart';
import '../../core/navigation/services/navigation_service.dart';
import '../../global/utils/custom_colors.dart';
import '../../main.dart';
import '../../xscreen_main/main_screen.dart';
import '../../screen_home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class OnboardNavigateButton extends StatelessWidget {
  OnboardNavigateButton({Key? key}) : super(key: key);

  var appSettingsViewModel = getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(0.15),
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: () {
          appSettingsViewModel.stopShowingOnboard();
          NavigationService.shared
              .navigateAndReplaceTo(NavigationRoute.toMainScreen(MainScreen()));
        },
        child: ElevatedButton(
            child: Icon(
              Icons.arrow_right_alt,
              color: context.colorScheme.onSurface,
              size: context.getWidth(0.08),
            ),
            onPressed: null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  context.colorScheme.secondary),
              elevation: MaterialStateProperty.all<double>(12),
              shadowColor: MaterialStateProperty.all<Color>(
                  context.colorScheme.secondary),
            )),
      ),
    );
  }
}
