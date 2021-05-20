import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_exception.freezed.dart';

@freezed
class SearchException with _$SearchException {
  @Implements(Exception)
  const factory SearchException.trendsFetchingException() = TrendsFetchingException;
  @Implements(Exception)
  const factory SearchException.getCoinsBySearch() = GetCoinsBySearch;
}
