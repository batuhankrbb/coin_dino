// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'market_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MarketExceptionTearOff {
  const _$MarketExceptionTearOff();

  CategoryFetchingException categoryFetchingException() {
    return const CategoryFetchingException();
  }

  CryptoCurrencyFetchingException cryptoCurrencyFetchingException() {
    return const CryptoCurrencyFetchingException();
  }
}

/// @nodoc
const $MarketException = _$MarketExceptionTearOff();

/// @nodoc
mixin _$MarketException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryFetchingException,
    required TResult Function() cryptoCurrencyFetchingException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryFetchingException,
    TResult Function()? cryptoCurrencyFetchingException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFetchingException value)
        categoryFetchingException,
    required TResult Function(CryptoCurrencyFetchingException value)
        cryptoCurrencyFetchingException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFetchingException value)?
        categoryFetchingException,
    TResult Function(CryptoCurrencyFetchingException value)?
        cryptoCurrencyFetchingException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketExceptionCopyWith<$Res> {
  factory $MarketExceptionCopyWith(
          MarketException value, $Res Function(MarketException) then) =
      _$MarketExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$MarketExceptionCopyWithImpl<$Res>
    implements $MarketExceptionCopyWith<$Res> {
  _$MarketExceptionCopyWithImpl(this._value, this._then);

  final MarketException _value;
  // ignore: unused_field
  final $Res Function(MarketException) _then;
}

/// @nodoc
abstract class $CategoryFetchingExceptionCopyWith<$Res> {
  factory $CategoryFetchingExceptionCopyWith(CategoryFetchingException value,
          $Res Function(CategoryFetchingException) then) =
      _$CategoryFetchingExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryFetchingExceptionCopyWithImpl<$Res>
    extends _$MarketExceptionCopyWithImpl<$Res>
    implements $CategoryFetchingExceptionCopyWith<$Res> {
  _$CategoryFetchingExceptionCopyWithImpl(CategoryFetchingException _value,
      $Res Function(CategoryFetchingException) _then)
      : super(_value, (v) => _then(v as CategoryFetchingException));

  @override
  CategoryFetchingException get _value =>
      super._value as CategoryFetchingException;
}

/// @nodoc

@Implements(Exception)
class _$CategoryFetchingException implements CategoryFetchingException {
  const _$CategoryFetchingException();

  @override
  String toString() {
    return 'MarketException.categoryFetchingException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CategoryFetchingException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryFetchingException,
    required TResult Function() cryptoCurrencyFetchingException,
  }) {
    return categoryFetchingException();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryFetchingException,
    TResult Function()? cryptoCurrencyFetchingException,
    required TResult orElse(),
  }) {
    if (categoryFetchingException != null) {
      return categoryFetchingException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFetchingException value)
        categoryFetchingException,
    required TResult Function(CryptoCurrencyFetchingException value)
        cryptoCurrencyFetchingException,
  }) {
    return categoryFetchingException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFetchingException value)?
        categoryFetchingException,
    TResult Function(CryptoCurrencyFetchingException value)?
        cryptoCurrencyFetchingException,
    required TResult orElse(),
  }) {
    if (categoryFetchingException != null) {
      return categoryFetchingException(this);
    }
    return orElse();
  }
}

abstract class CategoryFetchingException implements MarketException, Exception {
  const factory CategoryFetchingException() = _$CategoryFetchingException;
}

/// @nodoc
abstract class $CryptoCurrencyFetchingExceptionCopyWith<$Res> {
  factory $CryptoCurrencyFetchingExceptionCopyWith(
          CryptoCurrencyFetchingException value,
          $Res Function(CryptoCurrencyFetchingException) then) =
      _$CryptoCurrencyFetchingExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$CryptoCurrencyFetchingExceptionCopyWithImpl<$Res>
    extends _$MarketExceptionCopyWithImpl<$Res>
    implements $CryptoCurrencyFetchingExceptionCopyWith<$Res> {
  _$CryptoCurrencyFetchingExceptionCopyWithImpl(
      CryptoCurrencyFetchingException _value,
      $Res Function(CryptoCurrencyFetchingException) _then)
      : super(_value, (v) => _then(v as CryptoCurrencyFetchingException));

  @override
  CryptoCurrencyFetchingException get _value =>
      super._value as CryptoCurrencyFetchingException;
}

/// @nodoc

@Implements(Exception)
class _$CryptoCurrencyFetchingException
    implements CryptoCurrencyFetchingException {
  const _$CryptoCurrencyFetchingException();

  @override
  String toString() {
    return 'MarketException.cryptoCurrencyFetchingException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CryptoCurrencyFetchingException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryFetchingException,
    required TResult Function() cryptoCurrencyFetchingException,
  }) {
    return cryptoCurrencyFetchingException();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryFetchingException,
    TResult Function()? cryptoCurrencyFetchingException,
    required TResult orElse(),
  }) {
    if (cryptoCurrencyFetchingException != null) {
      return cryptoCurrencyFetchingException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFetchingException value)
        categoryFetchingException,
    required TResult Function(CryptoCurrencyFetchingException value)
        cryptoCurrencyFetchingException,
  }) {
    return cryptoCurrencyFetchingException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFetchingException value)?
        categoryFetchingException,
    TResult Function(CryptoCurrencyFetchingException value)?
        cryptoCurrencyFetchingException,
    required TResult orElse(),
  }) {
    if (cryptoCurrencyFetchingException != null) {
      return cryptoCurrencyFetchingException(this);
    }
    return orElse();
  }
}

abstract class CryptoCurrencyFetchingException
    implements MarketException, Exception {
  const factory CryptoCurrencyFetchingException() =
      _$CryptoCurrencyFetchingException;
}
