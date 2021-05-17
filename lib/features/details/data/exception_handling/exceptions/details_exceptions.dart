import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_exceptions.freezed.dart';


@freezed
class DetailsException with _$DetailsException{
  @Implements(Exception)
  const factory DetailsException.chartFetchingException() = ChartFetchingException;
  @Implements(Exception)
  const factory DetailsException.detailsFetchingException() = DetailsFetchingException;
}