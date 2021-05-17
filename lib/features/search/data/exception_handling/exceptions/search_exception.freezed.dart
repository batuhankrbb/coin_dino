// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchExceptionTearOff {
  const _$SearchExceptionTearOff();

  TrendsFetchingException trendsFetchingException() {
    return const TrendsFetchingException();
  }
}

/// @nodoc
const $SearchException = _$SearchExceptionTearOff();

/// @nodoc
mixin _$SearchException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() trendsFetchingException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? trendsFetchingException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendsFetchingException value)
        trendsFetchingException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendsFetchingException value)? trendsFetchingException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchExceptionCopyWith<$Res> {
  factory $SearchExceptionCopyWith(
          SearchException value, $Res Function(SearchException) then) =
      _$SearchExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchExceptionCopyWithImpl<$Res>
    implements $SearchExceptionCopyWith<$Res> {
  _$SearchExceptionCopyWithImpl(this._value, this._then);

  final SearchException _value;
  // ignore: unused_field
  final $Res Function(SearchException) _then;
}

/// @nodoc
abstract class $TrendsFetchingExceptionCopyWith<$Res> {
  factory $TrendsFetchingExceptionCopyWith(TrendsFetchingException value,
          $Res Function(TrendsFetchingException) then) =
      _$TrendsFetchingExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$TrendsFetchingExceptionCopyWithImpl<$Res>
    extends _$SearchExceptionCopyWithImpl<$Res>
    implements $TrendsFetchingExceptionCopyWith<$Res> {
  _$TrendsFetchingExceptionCopyWithImpl(TrendsFetchingException _value,
      $Res Function(TrendsFetchingException) _then)
      : super(_value, (v) => _then(v as TrendsFetchingException));

  @override
  TrendsFetchingException get _value => super._value as TrendsFetchingException;
}

/// @nodoc

@Implements(Exception)
class _$TrendsFetchingException implements TrendsFetchingException {
  const _$TrendsFetchingException();

  @override
  String toString() {
    return 'SearchException.trendsFetchingException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TrendsFetchingException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() trendsFetchingException,
  }) {
    return trendsFetchingException();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? trendsFetchingException,
    required TResult orElse(),
  }) {
    if (trendsFetchingException != null) {
      return trendsFetchingException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendsFetchingException value)
        trendsFetchingException,
  }) {
    return trendsFetchingException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendsFetchingException value)? trendsFetchingException,
    required TResult orElse(),
  }) {
    if (trendsFetchingException != null) {
      return trendsFetchingException(this);
    }
    return orElse();
  }
}

abstract class TrendsFetchingException implements SearchException, Exception {
  const factory TrendsFetchingException() = _$TrendsFetchingException;
}
