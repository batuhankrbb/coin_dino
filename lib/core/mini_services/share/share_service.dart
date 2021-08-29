import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  static final shared = ShareService._privateConstructor();

  ShareService._privateConstructor();

  Future<void> share(
      {required String text,
      required BuildContext context,
      String? subject}) async {
    await Share.share(
      text,
      subject: subject,
      sharePositionOrigin: _getShareRect(context),
    );
  }

  Future<void> shareApp({required BuildContext context}) async {
    await Share.share(
      "MINI_SERVICE.SHARE_MAIN_TEXT".tr(),
      subject: "MINI_SERVICE.SHARE_SUBJECT_TEXT".tr(),
      sharePositionOrigin: _getShareRect(context),
    );
  }

  Rect? _getShareRect(BuildContext context) {
    var size = context.size;
    if (size == null) {
      return null;
    }
    return Rect.fromLTWH(0, 0, size.width, size.height / 2);
  }
}
