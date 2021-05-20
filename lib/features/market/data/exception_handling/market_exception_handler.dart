import '../../../../core/error_handling/custom_failure.dart';
import 'exceptions/market_exceptions.dart';

class MarketExceptionHandler {
  CustomFailure handleException(MarketException exception) {
    return exception.when(categoryFetchingException: () {
      return CustomFailure(message: "There is an error in category fetching");
    }, cryptoCurrencyFetchingException: () {
      return CustomFailure(message: "There is an error in category fetching");
    });
  }
}
