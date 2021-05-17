import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_exceptions.freezed.dart';


@freezed
class MarketException with _$MarketException {
  @Implements(Exception)
  const factory MarketException.categoryFetchingException() = CategoryFetchingException;
  @Implements(Exception)
  const factory MarketException.cryptoCurrencyFetchingException() = CryptoCurrencyFetchingException;
}
