// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'preferences_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PreferencesExceptionTearOff {
  const _$PreferencesExceptionTearOff();

  Test test() {
    return const Test();
  }
}

/// @nodoc
const $PreferencesException = _$PreferencesExceptionTearOff();

/// @nodoc
mixin _$PreferencesException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() test,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? test,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Test value) test,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Test value)? test,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesExceptionCopyWith<$Res> {
  factory $PreferencesExceptionCopyWith(PreferencesException value,
          $Res Function(PreferencesException) then) =
      _$PreferencesExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$PreferencesExceptionCopyWithImpl<$Res>
    implements $PreferencesExceptionCopyWith<$Res> {
  _$PreferencesExceptionCopyWithImpl(this._value, this._then);

  final PreferencesException _value;
  // ignore: unused_field
  final $Res Function(PreferencesException) _then;
}

/// @nodoc
abstract class $TestCopyWith<$Res> {
  factory $TestCopyWith(Test value, $Res Function(Test) then) =
      _$TestCopyWithImpl<$Res>;
}

/// @nodoc
class _$TestCopyWithImpl<$Res> extends _$PreferencesExceptionCopyWithImpl<$Res>
    implements $TestCopyWith<$Res> {
  _$TestCopyWithImpl(Test _value, $Res Function(Test) _then)
      : super(_value, (v) => _then(v as Test));

  @override
  Test get _value => super._value as Test;
}

/// @nodoc

@Implements(Exception)
class _$Test implements Test {
  const _$Test();

  @override
  String toString() {
    return 'PreferencesException.test()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Test);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() test,
  }) {
    return test();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? test,
    required TResult orElse(),
  }) {
    if (test != null) {
      return test();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Test value) test,
  }) {
    return test(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Test value)? test,
    required TResult orElse(),
  }) {
    if (test != null) {
      return test(this);
    }
    return orElse();
  }
}

abstract class Test implements PreferencesException, Exception {
  const factory Test() = _$Test;
}
