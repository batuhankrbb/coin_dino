// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'navigation_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationRouteTearOff {
  const _$NavigationRouteTearOff();

  RouteSelectionPage toSelectionPage(SelectionPage selectionPage) {
    return RouteSelectionPage(
      selectionPage,
    );
  }
}

/// @nodoc
const $NavigationRoute = _$NavigationRouteTearOff();

/// @nodoc
mixin _$NavigationRoute {
  SelectionPage get selectionPage => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SelectionPage selectionPage) toSelectionPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouteSelectionPage value) toSelectionPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationRouteCopyWith<NavigationRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationRouteCopyWith<$Res> {
  factory $NavigationRouteCopyWith(
          NavigationRoute value, $Res Function(NavigationRoute) then) =
      _$NavigationRouteCopyWithImpl<$Res>;
  $Res call({SelectionPage selectionPage});
}

/// @nodoc
class _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteCopyWith<$Res> {
  _$NavigationRouteCopyWithImpl(this._value, this._then);

  final NavigationRoute _value;
  // ignore: unused_field
  final $Res Function(NavigationRoute) _then;

  @override
  $Res call({
    Object? selectionPage = freezed,
  }) {
    return _then(_value.copyWith(
      selectionPage: selectionPage == freezed
          ? _value.selectionPage
          : selectionPage // ignore: cast_nullable_to_non_nullable
              as SelectionPage,
    ));
  }
}

/// @nodoc
abstract class $RouteSelectionPageCopyWith<$Res>
    implements $NavigationRouteCopyWith<$Res> {
  factory $RouteSelectionPageCopyWith(
          RouteSelectionPage value, $Res Function(RouteSelectionPage) then) =
      _$RouteSelectionPageCopyWithImpl<$Res>;
  @override
  $Res call({SelectionPage selectionPage});
}

/// @nodoc
class _$RouteSelectionPageCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $RouteSelectionPageCopyWith<$Res> {
  _$RouteSelectionPageCopyWithImpl(
      RouteSelectionPage _value, $Res Function(RouteSelectionPage) _then)
      : super(_value, (v) => _then(v as RouteSelectionPage));

  @override
  RouteSelectionPage get _value => super._value as RouteSelectionPage;

  @override
  $Res call({
    Object? selectionPage = freezed,
  }) {
    return _then(RouteSelectionPage(
      selectionPage == freezed
          ? _value.selectionPage
          : selectionPage // ignore: cast_nullable_to_non_nullable
              as SelectionPage,
    ));
  }
}

/// @nodoc

class _$RouteSelectionPage implements RouteSelectionPage {
  const _$RouteSelectionPage(this.selectionPage);

  @override
  final SelectionPage selectionPage;

  @override
  String toString() {
    return 'NavigationRoute.toSelectionPage(selectionPage: $selectionPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteSelectionPage &&
            (identical(other.selectionPage, selectionPage) ||
                const DeepCollectionEquality()
                    .equals(other.selectionPage, selectionPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selectionPage);

  @JsonKey(ignore: true)
  @override
  $RouteSelectionPageCopyWith<RouteSelectionPage> get copyWith =>
      _$RouteSelectionPageCopyWithImpl<RouteSelectionPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SelectionPage selectionPage) toSelectionPage,
  }) {
    return toSelectionPage(selectionPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    required TResult orElse(),
  }) {
    if (toSelectionPage != null) {
      return toSelectionPage(selectionPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouteSelectionPage value) toSelectionPage,
  }) {
    return toSelectionPage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    required TResult orElse(),
  }) {
    if (toSelectionPage != null) {
      return toSelectionPage(this);
    }
    return orElse();
  }
}

abstract class RouteSelectionPage implements NavigationRoute {
  const factory RouteSelectionPage(SelectionPage selectionPage) =
      _$RouteSelectionPage;

  @override
  SelectionPage get selectionPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $RouteSelectionPageCopyWith<RouteSelectionPage> get copyWith =>
      throw _privateConstructorUsedError;
}
