import 'dart:core';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static final shared = UrlLauncherService._privateConstructor();

  UrlLauncherService._privateConstructor();

  Future<void> sendEmail(
      {required String mail, required String subject, String? body}) async {
    var uri = Uri(
        scheme: "mailto",
        path: mail,
        queryParameters: {"subject": subject, "body": body});

    await launch(uri.toString());
  }

  Future<void> sendContactEmail() async {
    var uri = Uri(
        scheme: "mailto",
        path: "batuhankarababa@gmail.com",
        queryParameters: {
          "subject": "MINI_SERVICE_URL_LAUNCHER_SEND_CONTANT_MAIL_SUBJECT_TEXT".tr(),
          "body": "MINI_SERVICE_URL_LAUNCHER_SEND_CONTANT_MAIL_BODY_TEXT".tr()
        });

    await launch(uri.toString());
  }

  Future<void> openUrl(String url) async {
    await launch(url, forceSafariVC: false, forceWebView: true);
  }
}
