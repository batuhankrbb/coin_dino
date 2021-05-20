import '../../../../core/error_handling/custom_failure.dart';
import 'exceptions/search_exception.dart';

class SearchExceptionHandler {
  CustomFailure handleException(SearchException exception) {
    return exception.when(trendsFetchingException: () {
      return CustomFailure(message: "There is an error in Trends Fetching");
    }, getCoinsBySearchException: () {
      return CustomFailure(message: "There is an error in Coins Fetching");
    });
  }
}
