import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_exceptions.freezed.dart';

//TODO SERCAN - BURADA İHTİYACIN OLAN EXCEPTIONLARI EKLERSİN  NULL VERİ EXCEPTION, VB VB. BUNLARI DATASOURCEIMPLEMENTATIONDA THROW EDICEZ
@freezed
class DetailsException with _$DetailsException{
  @Implements(Exception)
  const factory DetailsException.noInternetException() = NoInternetException;
}