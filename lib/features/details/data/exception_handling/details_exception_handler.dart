import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/details/data/exception_handling/exceptions/details_exceptions.dart';

class DetailsExceptionHandler {
  CustomFailure handleException(DetailsException exception) {
    return exception.when(noInternetException: () {
      return CustomFailure(message: "No Internet Connection in details");
    });
  }
}
