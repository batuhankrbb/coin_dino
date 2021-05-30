import 'package:share_plus/share_plus.dart';

class ShareService {

  static final shared = ShareService();

  Future<void> share({required String text, String? subject}) async {
    await Share.share(text, subject: subject);
  }

  Future<void> shareApp() async {
    await Share.share("Hey, Look at this app it is really good!!!",
        subject: "Coin Dino Subject");
  }
}
