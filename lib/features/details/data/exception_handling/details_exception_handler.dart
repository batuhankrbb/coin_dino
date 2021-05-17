import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/details/data/exception_handling/exceptions/details_exceptions.dart';

class DetailsExceptionHandler {
  CustomFailure handleException(DetailsException exception) {
    return exception.when(chartFetchingException: () {
      return CustomFailure(message: "There is an error in chart");
    }, detailsFetchingException: () {
      return CustomFailure(message: "There is an error in details");
    });
  }
}
