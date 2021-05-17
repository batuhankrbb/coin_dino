import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/features/market/data/exception_handling/exceptions/market_exceptions.dart';

class MarketExceptionHandler {
  CustomFailure handleException(MarketException exception) {
    return exception.when(noInternetException: () {
      return CustomFailure(message: "No Internet!!");
    });
  }
}
