import '../../../../core/error_handling/custom_failure.dart';
import '../../../../core/result_types/result.dart';
import 'exceptions/details_exceptions.dart';

class DetailsExceptionHandler {
  CustomFailure handleException(DetailsException exception) {
    return exception.when(chartFetchingException: () {
      return CustomFailure(message: "There is an error in chart");
    }, detailsFetchingException: () {
      return CustomFailure(message: "There is an error in details");
    });
  }
}
