// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StateResultTearOff {
  const _$StateResultTearOff();

  Initial<T> initial<T>() {
    return Initial<T>();
  }

  Loading<T> loading<T>() {
    return Loading<T>();
  }

  Completed<T> completed<T>(T data) {
    return Completed<T>(
      data,
    );
  }

  Failed<T> failed<T>(CustomFailure failure) {
    return Failed<T>(
      failure,
    );
  }
}

/// @nodoc
const $StateResult = _$StateResultTearOff();

/// @nodoc
mixin _$StateResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) completed,
    required TResult Function(CustomFailure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? completed,
    TResult Function(CustomFailure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Completed<T> value) completed,
    required TResult Function(Failed<T> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Completed<T> value)? completed,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateResultCopyWith<T, $Res> {
  factory $StateResultCopyWith(
          StateResult<T> value, $Res Function(StateResult<T>) then) =
      _$StateResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$StateResultCopyWithImpl<T, $Res>
    implements $StateResultCopyWith<T, $Res> {
  _$StateResultCopyWithImpl(this._value, this._then);

  final StateResult<T> _value;
  // ignore: unused_field
  final $Res Function(StateResult<T>) _then;
}

/// @nodoc
abstract class $InitialCopyWith<T, $Res> {
  factory $InitialCopyWith(Initial<T> value, $Res Function(Initial<T>) then) =
      _$InitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<T, $Res> extends _$StateResultCopyWithImpl<T, $Res>
    implements $InitialCopyWith<T, $Res> {
  _$InitialCopyWithImpl(Initial<T> _value, $Res Function(Initial<T>) _then)
      : super(_value, (v) => _then(v as Initial<T>));

  @override
  Initial<T> get _value => super._value as Initial<T>;
}

/// @nodoc

class _$Initial<T> implements Initial<T> {
  const _$Initial();

  @override
  String toString() {
    return 'StateResult<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) completed,
    required TResult Function(CustomFailure failure) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? completed,
    TResult Function(CustomFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Completed<T> value) completed,
    required TResult Function(Failed<T> value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Completed<T> value)? completed,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial<T> implements StateResult<T> {
  const factory Initial() = _$Initial<T>;
}

/// @nodoc
abstract class $LoadingCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) then) =
      _$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<T, $Res> extends _$StateResultCopyWithImpl<T, $Res>
    implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(Loading<T> _value, $Res Function(Loading<T>) _then)
      : super(_value, (v) => _then(v as Loading<T>));

  @override
  Loading<T> get _value => super._value as Loading<T>;
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  const _$Loading();

  @override
  String toString() {
    return 'StateResult<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) completed,
    required TResult Function(CustomFailure failure) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? completed,
    TResult Function(CustomFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Completed<T> value) completed,
    required TResult Function(Failed<T> value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Completed<T> value)? completed,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements StateResult<T> {
  const factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class $CompletedCopyWith<T, $Res> {
  factory $CompletedCopyWith(
          Completed<T> value, $Res Function(Completed<T>) then) =
      _$CompletedCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$CompletedCopyWithImpl<T, $Res>
    extends _$StateResultCopyWithImpl<T, $Res>
    implements $CompletedCopyWith<T, $Res> {
  _$CompletedCopyWithImpl(
      Completed<T> _value, $Res Function(Completed<T>) _then)
      : super(_value, (v) => _then(v as Completed<T>));

  @override
  Completed<T> get _value => super._value as Completed<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Completed<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Completed<T> implements Completed<T> {
  const _$Completed(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'StateResult<$T>.completed(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Completed<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $CompletedCopyWith<T, Completed<T>> get copyWith =>
      _$CompletedCopyWithImpl<T, Completed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) completed,
    required TResult Function(CustomFailure failure) failed,
  }) {
    return completed(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? completed,
    TResult Function(CustomFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Completed<T> value) completed,
    required TResult Function(Failed<T> value) failed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Completed<T> value)? completed,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class Completed<T> implements StateResult<T> {
  const factory Completed(T data) = _$Completed<T>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompletedCopyWith<T, Completed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailedCopyWith<T, $Res> {
  factory $FailedCopyWith(Failed<T> value, $Res Function(Failed<T>) then) =
      _$FailedCopyWithImpl<T, $Res>;
  $Res call({CustomFailure failure});
}

/// @nodoc
class _$FailedCopyWithImpl<T, $Res> extends _$StateResultCopyWithImpl<T, $Res>
    implements $FailedCopyWith<T, $Res> {
  _$FailedCopyWithImpl(Failed<T> _value, $Res Function(Failed<T>) _then)
      : super(_value, (v) => _then(v as Failed<T>));

  @override
  Failed<T> get _value => super._value as Failed<T>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(Failed<T>(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as CustomFailure,
    ));
  }
}

/// @nodoc

class _$Failed<T> implements Failed<T> {
  const _$Failed(this.failure);

  @override
  final CustomFailure failure;

  @override
  String toString() {
    return 'StateResult<$T>.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failed<T> &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $FailedCopyWith<T, Failed<T>> get copyWith =>
      _$FailedCopyWithImpl<T, Failed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) completed,
    required TResult Function(CustomFailure failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? completed,
    TResult Function(CustomFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Completed<T> value) completed,
    required TResult Function(Failed<T> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Completed<T> value)? completed,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed<T> implements StateResult<T> {
  const factory Failed(CustomFailure failure) = _$Failed<T>;

  CustomFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailedCopyWith<T, Failed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
