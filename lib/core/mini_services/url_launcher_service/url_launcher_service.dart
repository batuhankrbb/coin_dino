import 'dart:core';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static final shared = UrlLauncherService();

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
          "subject": "Feedback",
          "body": "Hello, I have a feedback for Coin Dino."
        });

      await launch(uri.toString());
  }
}
