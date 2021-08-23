import '../../core/mini_services/rating/rating_service.dart';
import '../../core/mini_services/share/share_service.dart';
import '../../core/mini_services/url_launcher/url_launcher_service.dart';
import 'settings_form_header.dart';
import 'settings_form_row.dart';
import 'settings_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsOtherSection extends StatelessWidget {
  const SettingsOtherSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection(
      backgroundColor: context.colorScheme.primaryVariant,
      header: SettingsFormHeader(
        headerTitle: "SETTINGS_SCREEN_FORM_HEADER_OTHERS".tr(),
        headerIcon: Icons.apps,
      ),
      children: [
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.share),
          title: "SETTINGS_SCREEN_FORM_SHARE_TITLE".tr(),
          onTap: () async {
            await ShareService.shared.shareApp();
          },
        ),
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.mail),
          title: "SETTINGS_SCREEN_FORM_CONTACT_TITLE".tr(),
          subTitle: "SETTINGS_SCREEN_FORM_CONTACT_SUBTITLE".tr(),
          onTap: () async {
            await UrlLauncherService.shared.sendContactEmail();
          },
        ),
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.star),
          title: "SETTINGS_SCREEN_FORM_RATE_TITLE".tr(),
          subTitle: "SETTINGS_SCREEN_FORM_RATE_SUBTITLE".tr(),
          onTap: () async {
            await RatingService.shared.requestReview();
          },
        )
      ],
    );
  }
}
