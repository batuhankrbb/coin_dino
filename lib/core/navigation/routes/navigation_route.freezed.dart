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

  RouteDetailsPage toDetails(CoinDetailScreen detailScreen) {
    return RouteDetailsPage(
      detailScreen,
    );
  }

  RouteAlertPage toAlert(AlertDetailScreen alertDetailScreen) {
    return RouteAlertPage(
      alertDetailScreen,
    );
  }

  RouteAlertListPage toAlertList(AlertListScreen alertListScreen) {
    return RouteAlertListPage(
      alertListScreen,
    );
  }

  RouteInAppPurchase toInAppPurchase(InAppPurchaseScreen inAppPurchaseScreen) {
    return RouteInAppPurchase(
      inAppPurchaseScreen,
    );
  }

  RouteMainScreen toMainScreen(MainScreen mainScreen) {
    return RouteMainScreen(
      mainScreen,
    );
  }
}

/// @nodoc
const $NavigationRoute = _$NavigationRouteTearOff();

/// @nodoc
mixin _$NavigationRoute {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SelectionPage selectionPage) toSelectionPage,
    required TResult Function(CoinDetailScreen detailScreen) toDetails,
    required TResult Function(AlertDetailScreen alertDetailScreen) toAlert,
    required TResult Function(AlertListScreen alertListScreen) toAlertList,
    required TResult Function(InAppPurchaseScreen inAppPurchaseScreen)
        toInAppPurchase,
    required TResult Function(MainScreen mainScreen) toMainScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    TResult Function(CoinDetailScreen detailScreen)? toDetails,
    TResult Function(AlertDetailScreen alertDetailScreen)? toAlert,
    TResult Function(AlertListScreen alertListScreen)? toAlertList,
    TResult Function(InAppPurchaseScreen inAppPurchaseScreen)? toInAppPurchase,
    TResult Function(MainScreen mainScreen)? toMainScreen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouteSelectionPage value) toSelectionPage,
    required TResult Function(RouteDetailsPage value) toDetails,
    required TResult Function(RouteAlertPage value) toAlert,
    required TResult Function(RouteAlertListPage value) toAlertList,
    required TResult Function(RouteInAppPurchase value) toInAppPurchase,
    required TResult Function(RouteMainScreen value) toMainScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    TResult Function(RouteDetailsPage value)? toDetails,
    TResult Function(RouteAlertPage value)? toAlert,
    TResult Function(RouteAlertListPage value)? toAlertList,
    TResult Function(RouteInAppPurchase value)? toInAppPurchase,
    TResult Function(RouteMainScreen value)? toMainScreen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationRouteCopyWith<$Res> {
  factory $NavigationRouteCopyWith(
          NavigationRoute value, $Res Function(NavigationRoute) then) =
      _$NavigationRouteCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteCopyWith<$Res> {
  _$NavigationRouteCopyWithImpl(this._value, this._then);

  final NavigationRoute _value;
  // ignore: unused_field
  final $Res Function(NavigationRoute) _then;
}

/// @nodoc
abstract class $RouteSelectionPageCopyWith<$Res> {
  factory $RouteSelectionPageCopyWith(
          RouteSelectionPage value, $Res Function(RouteSelectionPage) then) =
      _$RouteSelectionPageCopyWithImpl<$Res>;
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
    required TResult Function(CoinDetailScreen detailScreen) toDetails,
    required TResult Function(AlertDetailScreen alertDetailScreen) toAlert,
    required TResult Function(AlertListScreen alertListScreen) toAlertList,
    required TResult Function(InAppPurchaseScreen inAppPurchaseScreen)
        toInAppPurchase,
    required TResult Function(MainScreen mainScreen) toMainScreen,
  }) {
    return toSelectionPage(selectionPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    TResult Function(CoinDetailScreen detailScreen)? toDetails,
    TResult Function(AlertDetailScreen alertDetailScreen)? toAlert,
    TResult Function(AlertListScreen alertListScreen)? toAlertList,
    TResult Function(InAppPurchaseScreen inAppPurchaseScreen)? toInAppPurchase,
    TResult Function(MainScreen mainScreen)? toMainScreen,
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
    required TResult Function(RouteDetailsPage value) toDetails,
    required TResult Function(RouteAlertPage value) toAlert,
    required TResult Function(RouteAlertListPage value) toAlertList,
    required TResult Function(RouteInAppPurchase value) toInAppPurchase,
    required TResult Function(RouteMainScreen value) toMainScreen,
  }) {
    return toSelectionPage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    TResult Function(RouteDetailsPage value)? toDetails,
    TResult Function(RouteAlertPage value)? toAlert,
    TResult Function(RouteAlertListPage value)? toAlertList,
    TResult Function(RouteInAppPurchase value)? toInAppPurchase,
    TResult Function(RouteMainScreen value)? toMainScreen,
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

  SelectionPage get selectionPage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteSelectionPageCopyWith<RouteSelectionPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDetailsPageCopyWith<$Res> {
  factory $RouteDetailsPageCopyWith(
          RouteDetailsPage value, $Res Function(RouteDetailsPage) then) =
      _$RouteDetailsPageCopyWithImpl<$Res>;
  $Res call({CoinDetailScreen detailScreen});
}

/// @nodoc
class _$RouteDetailsPageCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $RouteDetailsPageCopyWith<$Res> {
  _$RouteDetailsPageCopyWithImpl(
      RouteDetailsPage _value, $Res Function(RouteDetailsPage) _then)
      : super(_value, (v) => _then(v as RouteDetailsPage));

  @override
  RouteDetailsPage get _value => super._value as RouteDetailsPage;

  @override
  $Res call({
    Object? detailScreen = freezed,
  }) {
    return _then(RouteDetailsPage(
      detailScreen == freezed
          ? _value.detailScreen
          : detailScreen // ignore: cast_nullable_to_non_nullable
              as CoinDetailScreen,
    ));
  }
}

/// @nodoc

class _$RouteDetailsPage implements RouteDetailsPage {
  const _$RouteDetailsPage(this.detailScreen);

  @override
  final CoinDetailScreen detailScreen;

  @override
  String toString() {
    return 'NavigationRoute.toDetails(detailScreen: $detailScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteDetailsPage &&
            (identical(other.detailScreen, detailScreen) ||
                const DeepCollectionEquality()
                    .equals(other.detailScreen, detailScreen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(detailScreen);

  @JsonKey(ignore: true)
  @override
  $RouteDetailsPageCopyWith<RouteDetailsPage> get copyWith =>
      _$RouteDetailsPageCopyWithImpl<RouteDetailsPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SelectionPage selectionPage) toSelectionPage,
    required TResult Function(CoinDetailScreen detailScreen) toDetails,
    required TResult Function(AlertDetailScreen alertDetailScreen) toAlert,
    required TResult Function(AlertListScreen alertListScreen) toAlertList,
    required TResult Function(InAppPurchaseScreen inAppPurchaseScreen)
        toInAppPurchase,
    required TResult Function(MainScreen mainScreen) toMainScreen,
  }) {
    return toDetails(detailScreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    TResult Function(CoinDetailScreen detailScreen)? toDetails,
    TResult Function(AlertDetailScreen alertDetailScreen)? toAlert,
    TResult Function(AlertListScreen alertListScreen)? toAlertList,
    TResult Function(InAppPurchaseScreen inAppPurchaseScreen)? toInAppPurchase,
    TResult Function(MainScreen mainScreen)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toDetails != null) {
      return toDetails(detailScreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouteSelectionPage value) toSelectionPage,
    required TResult Function(RouteDetailsPage value) toDetails,
    required TResult Function(RouteAlertPage value) toAlert,
    required TResult Function(RouteAlertListPage value) toAlertList,
    required TResult Function(RouteInAppPurchase value) toInAppPurchase,
    required TResult Function(RouteMainScreen value) toMainScreen,
  }) {
    return toDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    TResult Function(RouteDetailsPage value)? toDetails,
    TResult Function(RouteAlertPage value)? toAlert,
    TResult Function(RouteAlertListPage value)? toAlertList,
    TResult Function(RouteInAppPurchase value)? toInAppPurchase,
    TResult Function(RouteMainScreen value)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toDetails != null) {
      return toDetails(this);
    }
    return orElse();
  }
}

abstract class RouteDetailsPage implements NavigationRoute {
  const factory RouteDetailsPage(CoinDetailScreen detailScreen) =
      _$RouteDetailsPage;

  CoinDetailScreen get detailScreen => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDetailsPageCopyWith<RouteDetailsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteAlertPageCopyWith<$Res> {
  factory $RouteAlertPageCopyWith(
          RouteAlertPage value, $Res Function(RouteAlertPage) then) =
      _$RouteAlertPageCopyWithImpl<$Res>;
  $Res call({AlertDetailScreen alertDetailScreen});
}

/// @nodoc
class _$RouteAlertPageCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $RouteAlertPageCopyWith<$Res> {
  _$RouteAlertPageCopyWithImpl(
      RouteAlertPage _value, $Res Function(RouteAlertPage) _then)
      : super(_value, (v) => _then(v as RouteAlertPage));

  @override
  RouteAlertPage get _value => super._value as RouteAlertPage;

  @override
  $Res call({
    Object? alertDetailScreen = freezed,
  }) {
    return _then(RouteAlertPage(
      alertDetailScreen == freezed
          ? _value.alertDetailScreen
          : alertDetailScreen // ignore: cast_nullable_to_non_nullable
              as AlertDetailScreen,
    ));
  }
}

/// @nodoc

class _$RouteAlertPage implements RouteAlertPage {
  const _$RouteAlertPage(this.alertDetailScreen);

  @override
  final AlertDetailScreen alertDetailScreen;

  @override
  String toString() {
    return 'NavigationRoute.toAlert(alertDetailScreen: $alertDetailScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteAlertPage &&
            (identical(other.alertDetailScreen, alertDetailScreen) ||
                const DeepCollectionEquality()
                    .equals(other.alertDetailScreen, alertDetailScreen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(alertDetailScreen);

  @JsonKey(ignore: true)
  @override
  $RouteAlertPageCopyWith<RouteAlertPage> get copyWith =>
      _$RouteAlertPageCopyWithImpl<RouteAlertPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SelectionPage selectionPage) toSelectionPage,
    required TResult Function(CoinDetailScreen detailScreen) toDetails,
    required TResult Function(AlertDetailScreen alertDetailScreen) toAlert,
    required TResult Function(AlertListScreen alertListScreen) toAlertList,
    required TResult Function(InAppPurchaseScreen inAppPurchaseScreen)
        toInAppPurchase,
    required TResult Function(MainScreen mainScreen) toMainScreen,
  }) {
    return toAlert(alertDetailScreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    TResult Function(CoinDetailScreen detailScreen)? toDetails,
    TResult Function(AlertDetailScreen alertDetailScreen)? toAlert,
    TResult Function(AlertListScreen alertListScreen)? toAlertList,
    TResult Function(InAppPurchaseScreen inAppPurchaseScreen)? toInAppPurchase,
    TResult Function(MainScreen mainScreen)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toAlert != null) {
      return toAlert(alertDetailScreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouteSelectionPage value) toSelectionPage,
    required TResult Function(RouteDetailsPage value) toDetails,
    required TResult Function(RouteAlertPage value) toAlert,
    required TResult Function(RouteAlertListPage value) toAlertList,
    required TResult Function(RouteInAppPurchase value) toInAppPurchase,
    required TResult Function(RouteMainScreen value) toMainScreen,
  }) {
    return toAlert(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    TResult Function(RouteDetailsPage value)? toDetails,
    TResult Function(RouteAlertPage value)? toAlert,
    TResult Function(RouteAlertListPage value)? toAlertList,
    TResult Function(RouteInAppPurchase value)? toInAppPurchase,
    TResult Function(RouteMainScreen value)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toAlert != null) {
      return toAlert(this);
    }
    return orElse();
  }
}

abstract class RouteAlertPage implements NavigationRoute {
  const factory RouteAlertPage(AlertDetailScreen alertDetailScreen) =
      _$RouteAlertPage;

  AlertDetailScreen get alertDetailScreen => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteAlertPageCopyWith<RouteAlertPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteAlertListPageCopyWith<$Res> {
  factory $RouteAlertListPageCopyWith(
          RouteAlertListPage value, $Res Function(RouteAlertListPage) then) =
      _$RouteAlertListPageCopyWithImpl<$Res>;
  $Res call({AlertListScreen alertListScreen});
}

/// @nodoc
class _$RouteAlertListPageCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $RouteAlertListPageCopyWith<$Res> {
  _$RouteAlertListPageCopyWithImpl(
      RouteAlertListPage _value, $Res Function(RouteAlertListPage) _then)
      : super(_value, (v) => _then(v as RouteAlertListPage));

  @override
  RouteAlertListPage get _value => super._value as RouteAlertListPage;

  @override
  $Res call({
    Object? alertListScreen = freezed,
  }) {
    return _then(RouteAlertListPage(
      alertListScreen == freezed
          ? _value.alertListScreen
          : alertListScreen // ignore: cast_nullable_to_non_nullable
              as AlertListScreen,
    ));
  }
}

/// @nodoc

class _$RouteAlertListPage implements RouteAlertListPage {
  const _$RouteAlertListPage(this.alertListScreen);

  @override
  final AlertListScreen alertListScreen;

  @override
  String toString() {
    return 'NavigationRoute.toAlertList(alertListScreen: $alertListScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteAlertListPage &&
            (identical(other.alertListScreen, alertListScreen) ||
                const DeepCollectionEquality()
                    .equals(other.alertListScreen, alertListScreen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(alertListScreen);

  @JsonKey(ignore: true)
  @override
  $RouteAlertListPageCopyWith<RouteAlertListPage> get copyWith =>
      _$RouteAlertListPageCopyWithImpl<RouteAlertListPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SelectionPage selectionPage) toSelectionPage,
    required TResult Function(CoinDetailScreen detailScreen) toDetails,
    required TResult Function(AlertDetailScreen alertDetailScreen) toAlert,
    required TResult Function(AlertListScreen alertListScreen) toAlertList,
    required TResult Function(InAppPurchaseScreen inAppPurchaseScreen)
        toInAppPurchase,
    required TResult Function(MainScreen mainScreen) toMainScreen,
  }) {
    return toAlertList(alertListScreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    TResult Function(CoinDetailScreen detailScreen)? toDetails,
    TResult Function(AlertDetailScreen alertDetailScreen)? toAlert,
    TResult Function(AlertListScreen alertListScreen)? toAlertList,
    TResult Function(InAppPurchaseScreen inAppPurchaseScreen)? toInAppPurchase,
    TResult Function(MainScreen mainScreen)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toAlertList != null) {
      return toAlertList(alertListScreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouteSelectionPage value) toSelectionPage,
    required TResult Function(RouteDetailsPage value) toDetails,
    required TResult Function(RouteAlertPage value) toAlert,
    required TResult Function(RouteAlertListPage value) toAlertList,
    required TResult Function(RouteInAppPurchase value) toInAppPurchase,
    required TResult Function(RouteMainScreen value) toMainScreen,
  }) {
    return toAlertList(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    TResult Function(RouteDetailsPage value)? toDetails,
    TResult Function(RouteAlertPage value)? toAlert,
    TResult Function(RouteAlertListPage value)? toAlertList,
    TResult Function(RouteInAppPurchase value)? toInAppPurchase,
    TResult Function(RouteMainScreen value)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toAlertList != null) {
      return toAlertList(this);
    }
    return orElse();
  }
}

abstract class RouteAlertListPage implements NavigationRoute {
  const factory RouteAlertListPage(AlertListScreen alertListScreen) =
      _$RouteAlertListPage;

  AlertListScreen get alertListScreen => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteAlertListPageCopyWith<RouteAlertListPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteInAppPurchaseCopyWith<$Res> {
  factory $RouteInAppPurchaseCopyWith(
          RouteInAppPurchase value, $Res Function(RouteInAppPurchase) then) =
      _$RouteInAppPurchaseCopyWithImpl<$Res>;
  $Res call({InAppPurchaseScreen inAppPurchaseScreen});
}

/// @nodoc
class _$RouteInAppPurchaseCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $RouteInAppPurchaseCopyWith<$Res> {
  _$RouteInAppPurchaseCopyWithImpl(
      RouteInAppPurchase _value, $Res Function(RouteInAppPurchase) _then)
      : super(_value, (v) => _then(v as RouteInAppPurchase));

  @override
  RouteInAppPurchase get _value => super._value as RouteInAppPurchase;

  @override
  $Res call({
    Object? inAppPurchaseScreen = freezed,
  }) {
    return _then(RouteInAppPurchase(
      inAppPurchaseScreen == freezed
          ? _value.inAppPurchaseScreen
          : inAppPurchaseScreen // ignore: cast_nullable_to_non_nullable
              as InAppPurchaseScreen,
    ));
  }
}

/// @nodoc

class _$RouteInAppPurchase implements RouteInAppPurchase {
  const _$RouteInAppPurchase(this.inAppPurchaseScreen);

  @override
  final InAppPurchaseScreen inAppPurchaseScreen;

  @override
  String toString() {
    return 'NavigationRoute.toInAppPurchase(inAppPurchaseScreen: $inAppPurchaseScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteInAppPurchase &&
            (identical(other.inAppPurchaseScreen, inAppPurchaseScreen) ||
                const DeepCollectionEquality()
                    .equals(other.inAppPurchaseScreen, inAppPurchaseScreen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(inAppPurchaseScreen);

  @JsonKey(ignore: true)
  @override
  $RouteInAppPurchaseCopyWith<RouteInAppPurchase> get copyWith =>
      _$RouteInAppPurchaseCopyWithImpl<RouteInAppPurchase>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SelectionPage selectionPage) toSelectionPage,
    required TResult Function(CoinDetailScreen detailScreen) toDetails,
    required TResult Function(AlertDetailScreen alertDetailScreen) toAlert,
    required TResult Function(AlertListScreen alertListScreen) toAlertList,
    required TResult Function(InAppPurchaseScreen inAppPurchaseScreen)
        toInAppPurchase,
    required TResult Function(MainScreen mainScreen) toMainScreen,
  }) {
    return toInAppPurchase(inAppPurchaseScreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    TResult Function(CoinDetailScreen detailScreen)? toDetails,
    TResult Function(AlertDetailScreen alertDetailScreen)? toAlert,
    TResult Function(AlertListScreen alertListScreen)? toAlertList,
    TResult Function(InAppPurchaseScreen inAppPurchaseScreen)? toInAppPurchase,
    TResult Function(MainScreen mainScreen)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toInAppPurchase != null) {
      return toInAppPurchase(inAppPurchaseScreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouteSelectionPage value) toSelectionPage,
    required TResult Function(RouteDetailsPage value) toDetails,
    required TResult Function(RouteAlertPage value) toAlert,
    required TResult Function(RouteAlertListPage value) toAlertList,
    required TResult Function(RouteInAppPurchase value) toInAppPurchase,
    required TResult Function(RouteMainScreen value) toMainScreen,
  }) {
    return toInAppPurchase(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    TResult Function(RouteDetailsPage value)? toDetails,
    TResult Function(RouteAlertPage value)? toAlert,
    TResult Function(RouteAlertListPage value)? toAlertList,
    TResult Function(RouteInAppPurchase value)? toInAppPurchase,
    TResult Function(RouteMainScreen value)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toInAppPurchase != null) {
      return toInAppPurchase(this);
    }
    return orElse();
  }
}

abstract class RouteInAppPurchase implements NavigationRoute {
  const factory RouteInAppPurchase(InAppPurchaseScreen inAppPurchaseScreen) =
      _$RouteInAppPurchase;

  InAppPurchaseScreen get inAppPurchaseScreen =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteInAppPurchaseCopyWith<RouteInAppPurchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteMainScreenCopyWith<$Res> {
  factory $RouteMainScreenCopyWith(
          RouteMainScreen value, $Res Function(RouteMainScreen) then) =
      _$RouteMainScreenCopyWithImpl<$Res>;
  $Res call({MainScreen mainScreen});
}

/// @nodoc
class _$RouteMainScreenCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $RouteMainScreenCopyWith<$Res> {
  _$RouteMainScreenCopyWithImpl(
      RouteMainScreen _value, $Res Function(RouteMainScreen) _then)
      : super(_value, (v) => _then(v as RouteMainScreen));

  @override
  RouteMainScreen get _value => super._value as RouteMainScreen;

  @override
  $Res call({
    Object? mainScreen = freezed,
  }) {
    return _then(RouteMainScreen(
      mainScreen == freezed
          ? _value.mainScreen
          : mainScreen // ignore: cast_nullable_to_non_nullable
              as MainScreen,
    ));
  }
}

/// @nodoc

class _$RouteMainScreen implements RouteMainScreen {
  const _$RouteMainScreen(this.mainScreen);

  @override
  final MainScreen mainScreen;

  @override
  String toString() {
    return 'NavigationRoute.toMainScreen(mainScreen: $mainScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteMainScreen &&
            (identical(other.mainScreen, mainScreen) ||
                const DeepCollectionEquality()
                    .equals(other.mainScreen, mainScreen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(mainScreen);

  @JsonKey(ignore: true)
  @override
  $RouteMainScreenCopyWith<RouteMainScreen> get copyWith =>
      _$RouteMainScreenCopyWithImpl<RouteMainScreen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SelectionPage selectionPage) toSelectionPage,
    required TResult Function(CoinDetailScreen detailScreen) toDetails,
    required TResult Function(AlertDetailScreen alertDetailScreen) toAlert,
    required TResult Function(AlertListScreen alertListScreen) toAlertList,
    required TResult Function(InAppPurchaseScreen inAppPurchaseScreen)
        toInAppPurchase,
    required TResult Function(MainScreen mainScreen) toMainScreen,
  }) {
    return toMainScreen(mainScreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SelectionPage selectionPage)? toSelectionPage,
    TResult Function(CoinDetailScreen detailScreen)? toDetails,
    TResult Function(AlertDetailScreen alertDetailScreen)? toAlert,
    TResult Function(AlertListScreen alertListScreen)? toAlertList,
    TResult Function(InAppPurchaseScreen inAppPurchaseScreen)? toInAppPurchase,
    TResult Function(MainScreen mainScreen)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toMainScreen != null) {
      return toMainScreen(mainScreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouteSelectionPage value) toSelectionPage,
    required TResult Function(RouteDetailsPage value) toDetails,
    required TResult Function(RouteAlertPage value) toAlert,
    required TResult Function(RouteAlertListPage value) toAlertList,
    required TResult Function(RouteInAppPurchase value) toInAppPurchase,
    required TResult Function(RouteMainScreen value) toMainScreen,
  }) {
    return toMainScreen(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouteSelectionPage value)? toSelectionPage,
    TResult Function(RouteDetailsPage value)? toDetails,
    TResult Function(RouteAlertPage value)? toAlert,
    TResult Function(RouteAlertListPage value)? toAlertList,
    TResult Function(RouteInAppPurchase value)? toInAppPurchase,
    TResult Function(RouteMainScreen value)? toMainScreen,
    required TResult orElse(),
  }) {
    if (toMainScreen != null) {
      return toMainScreen(this);
    }
    return orElse();
  }
}

abstract class RouteMainScreen implements NavigationRoute {
  const factory RouteMainScreen(MainScreen mainScreen) = _$RouteMainScreen;

  MainScreen get mainScreen => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteMainScreenCopyWith<RouteMainScreen> get copyWith =>
      throw _privateConstructorUsedError;
}
