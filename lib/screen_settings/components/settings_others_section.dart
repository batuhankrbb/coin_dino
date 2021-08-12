import '../../core/mini_services/rating/rating_service.dart';
import '../../core/mini_services/share/share_service.dart';
import '../../core/mini_services/url_launcher/url_launcher_service.dart';
import 'settings_form_header.dart';
import 'settings_form_row.dart';
import 'settings_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class SettingsOtherSection extends StatelessWidget {
  const SettingsOtherSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection(
      backgroundColor: context.colorScheme.primaryVariant,
      header: SettingsFormHeader(
        headerTitle: "Others",
        headerIcon: Icons.apps,
      ),
      children: [
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.share),
          title: "Share",
          onTap: () async {
            await ShareService.shared.shareApp();
          },
        ),
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.mail),
          title: "Contact",
          subTitle: "Contract with us to tell your problems & suggestions",
          onTap: () async {
            await UrlLauncherService.shared.sendContactEmail();
          },
        ),
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.star),
          title: "Rate App",
          subTitle: "Support us",
          onTap: () async {
            await RatingService.shared.requestReview();
          },
        )
      ],
    );
  }
}
