import 'package:in_app_review/in_app_review.dart';

class RatingService {
  static final shared = RatingService._privateConstructor();

  RatingService._privateConstructor();

  final InAppReview _inAppReview = InAppReview.instance;

  Future<void> requestReview() async {
    if (await _inAppReview.isAvailable()) {
      await _inAppReview.requestReview();
    }
  }
}
