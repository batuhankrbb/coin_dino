import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/features/search/data/exception_handling/exceptions/search_exception.dart';

class SearchExceptionHandler {
  CustomFailure handleException(SearchException exception) {
    return exception.when(trendsFetchingException: () {
      return CustomFailure(message: "There is an error in Trends Fetching");
    });
  }
}
