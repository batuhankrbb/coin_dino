import 'package:share_plus/share_plus.dart';

class ShareService {
  static final shared = ShareService();

  Future<void> share({required String text, String? subject}) async {
    await Share.share(text, subject: subject);
  }

  Future<void> shareApp() async {
    await Share.share(
        "Hey, I found an app that shows you a lot of information about cryptocurrencies. Check it out! [LINK]",
        subject: "Coin Dino Subject");
  }
}
