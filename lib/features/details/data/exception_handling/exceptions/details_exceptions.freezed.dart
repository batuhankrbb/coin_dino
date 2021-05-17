// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'details_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DetailsExceptionTearOff {
  const _$DetailsExceptionTearOff();

  NoInternetException noInternetException() {
    return const NoInternetException();
  }
}

/// @nodoc
const $DetailsException = _$DetailsExceptionTearOff();

/// @nodoc
mixin _$DetailsException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternetException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternetException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoInternetException value) noInternetException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoInternetException value)? noInternetException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsExceptionCopyWith<$Res> {
  factory $DetailsExceptionCopyWith(
          DetailsException value, $Res Function(DetailsException) then) =
      _$DetailsExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$DetailsExceptionCopyWithImpl<$Res>
    implements $DetailsExceptionCopyWith<$Res> {
  _$DetailsExceptionCopyWithImpl(this._value, this._then);

  final DetailsException _value;
  // ignore: unused_field
  final $Res Function(DetailsException) _then;
}

/// @nodoc
abstract class $NoInternetExceptionCopyWith<$Res> {
  factory $NoInternetExceptionCopyWith(
          NoInternetException value, $Res Function(NoInternetException) then) =
      _$NoInternetExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoInternetExceptionCopyWithImpl<$Res>
    extends _$DetailsExceptionCopyWithImpl<$Res>
    implements $NoInternetExceptionCopyWith<$Res> {
  _$NoInternetExceptionCopyWithImpl(
      NoInternetException _value, $Res Function(NoInternetException) _then)
      : super(_value, (v) => _then(v as NoInternetException));

  @override
  NoInternetException get _value => super._value as NoInternetException;
}

/// @nodoc

@Implements(Exception)
class _$NoInternetException implements NoInternetException {
  const _$NoInternetException();

  @override
  String toString() {
    return 'DetailsException.noInternetException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoInternetException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternetException,
  }) {
    return noInternetException();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternetException,
    required TResult orElse(),
  }) {
    if (noInternetException != null) {
      return noInternetException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoInternetException value) noInternetException,
  }) {
    return noInternetException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoInternetException value)? noInternetException,
    required TResult orElse(),
  }) {
    if (noInternetException != null) {
      return noInternetException(this);
    }
    return orElse();
  }
}

abstract class NoInternetException implements DetailsException, Exception {
  const factory NoInternetException() = _$NoInternetException;
}
