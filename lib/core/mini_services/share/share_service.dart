import 'package:share_plus/share_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class ShareService {
  static final shared = ShareService._privateConstructor();

  ShareService._privateConstructor();

  Future<void> share({required String text, String? subject}) async {
    await Share.share(text, subject: subject);
  }

  Future<void> shareApp() async {
    await Share.share(
        "MINI_SERVICE_SHARE_MAIN_TEXT".tr(),
        subject: "MINI_SERVICE_SHARE_SUBJECT_TEXT".tr());
  }
}
