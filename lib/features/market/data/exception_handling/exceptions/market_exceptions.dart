import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_exceptions.freezed.dart';


//TODO SERCAN - BURADA İHTİYACIN OLAN EXCEPTIONLARI EKLERSİN  NULL VERİ EXCEPTION, VB VB. BUNLARI DATASOURCEIMPLEMENTATIONDA THROW EDICEZ
@freezed
class MarketException with _$MarketException {
  @Implements(Exception)
  const factory MarketException.noInternetException() = NoInternetException;
}
