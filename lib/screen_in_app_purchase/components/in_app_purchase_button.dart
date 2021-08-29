import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/global/app_settings/app_settings_viewmodel.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class InAppPurchaseButton extends StatelessWidget {
  InAppPurchaseButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  var appSettingsVM = getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Observer(builder: (_) {
        return Container(
          width: context.getHeight(0.9),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(context.colorScheme.surface),
            ),
            onPressed: null,
            child: buildText(context),
          ),
        );
      }),
    );
  }

  AutoSizeText buildText(BuildContext context) {
    var buttonText = appSettingsVM.isPremium
        ? "INAPP_SCREEN.BUY_BUTTON_PREMIUM_TEXT"
        : "INAPP_SCREEN.BUY_BUTTON_TEXT";
    return AutoSizeText(
      buttonText.tr(),
      style: TextStyle(
        color: context.theme.hintColor,
        fontSize: context.getWidth(0.06),
      ),
    );
  }
}
