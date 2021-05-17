// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'network_clients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NetworkClientsTearOff {
  const _$NetworkClientsTearOff();

  CoinsMarket coinsMarket(
      String date, String sort, String? category, String vsCurrency) {
    return CoinsMarket(
      date,
      sort,
      category,
      vsCurrency,
    );
  }

  CoinsID coinsID(String id,
      {String? localization,
      String? tickers,
      String? marketdata,
      String? communitydata,
      String? developerdata,
      String? sparkline}) {
    return CoinsID(
      id,
      localization: localization,
      tickers: tickers,
      marketdata: marketdata,
      communitydata: communitydata,
      developerdata: developerdata,
      sparkline: sparkline,
    );
  }

  MarketChart martketChart(
      String id, String vsCurrency, String days, String interval) {
    return MarketChart(
      id,
      vsCurrency,
      days,
      interval,
    );
  }
}

/// @nodoc
const $NetworkClients = _$NetworkClientsTearOff();

/// @nodoc
mixin _$NetworkClients {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String date, String sort, String? category, String vsCurrency)
        coinsMarket,
    required TResult Function(
            String id,
            String? localization,
            String? tickers,
            String? marketdata,
            String? communitydata,
            String? developerdata,
            String? sparkline)
        coinsID,
    required TResult Function(
            String id, String vsCurrency, String days, String interval)
        martketChart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String date, String sort, String? category, String vsCurrency)?
        coinsMarket,
    TResult Function(
            String id,
            String? localization,
            String? tickers,
            String? marketdata,
            String? communitydata,
            String? developerdata,
            String? sparkline)?
        coinsID,
    TResult Function(
            String id, String vsCurrency, String days, String interval)?
        martketChart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoinsMarket value) coinsMarket,
    required TResult Function(CoinsID value) coinsID,
    required TResult Function(MarketChart value) martketChart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoinsMarket value)? coinsMarket,
    TResult Function(CoinsID value)? coinsID,
    TResult Function(MarketChart value)? martketChart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkClientsCopyWith<$Res> {
  factory $NetworkClientsCopyWith(
          NetworkClients value, $Res Function(NetworkClients) then) =
      _$NetworkClientsCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkClientsCopyWithImpl<$Res>
    implements $NetworkClientsCopyWith<$Res> {
  _$NetworkClientsCopyWithImpl(this._value, this._then);

  final NetworkClients _value;
  // ignore: unused_field
  final $Res Function(NetworkClients) _then;
}

/// @nodoc
abstract class $CoinsMarketCopyWith<$Res> {
  factory $CoinsMarketCopyWith(
          CoinsMarket value, $Res Function(CoinsMarket) then) =
      _$CoinsMarketCopyWithImpl<$Res>;
  $Res call({String date, String sort, String? category, String vsCurrency});
}

/// @nodoc
class _$CoinsMarketCopyWithImpl<$Res> extends _$NetworkClientsCopyWithImpl<$Res>
    implements $CoinsMarketCopyWith<$Res> {
  _$CoinsMarketCopyWithImpl(
      CoinsMarket _value, $Res Function(CoinsMarket) _then)
      : super(_value, (v) => _then(v as CoinsMarket));

  @override
  CoinsMarket get _value => super._value as CoinsMarket;

  @override
  $Res call({
    Object? date = freezed,
    Object? sort = freezed,
    Object? category = freezed,
    Object? vsCurrency = freezed,
  }) {
    return _then(CoinsMarket(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      vsCurrency == freezed
          ? _value.vsCurrency
          : vsCurrency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CoinsMarket extends CoinsMarket {
  const _$CoinsMarket(this.date, this.sort, this.category, this.vsCurrency)
      : super._();

  @override
  final String date;
  @override
  final String sort;
  @override
  final String? category;
  @override
  final String vsCurrency;

  @override
  String toString() {
    return 'NetworkClients.coinsMarket(date: $date, sort: $sort, category: $category, vsCurrency: $vsCurrency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CoinsMarket &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.vsCurrency, vsCurrency) ||
                const DeepCollectionEquality()
                    .equals(other.vsCurrency, vsCurrency)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(sort) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(vsCurrency);

  @JsonKey(ignore: true)
  @override
  $CoinsMarketCopyWith<CoinsMarket> get copyWith =>
      _$CoinsMarketCopyWithImpl<CoinsMarket>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String date, String sort, String? category, String vsCurrency)
        coinsMarket,
    required TResult Function(
            String id,
            String? localization,
            String? tickers,
            String? marketdata,
            String? communitydata,
            String? developerdata,
            String? sparkline)
        coinsID,
    required TResult Function(
            String id, String vsCurrency, String days, String interval)
        martketChart,
  }) {
    return coinsMarket(date, sort, category, vsCurrency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String date, String sort, String? category, String vsCurrency)?
        coinsMarket,
    TResult Function(
            String id,
            String? localization,
            String? tickers,
            String? marketdata,
            String? communitydata,
            String? developerdata,
            String? sparkline)?
        coinsID,
    TResult Function(
            String id, String vsCurrency, String days, String interval)?
        martketChart,
    required TResult orElse(),
  }) {
    if (coinsMarket != null) {
      return coinsMarket(date, sort, category, vsCurrency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoinsMarket value) coinsMarket,
    required TResult Function(CoinsID value) coinsID,
    required TResult Function(MarketChart value) martketChart,
  }) {
    return coinsMarket(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoinsMarket value)? coinsMarket,
    TResult Function(CoinsID value)? coinsID,
    TResult Function(MarketChart value)? martketChart,
    required TResult orElse(),
  }) {
    if (coinsMarket != null) {
      return coinsMarket(this);
    }
    return orElse();
  }
}

abstract class CoinsMarket extends NetworkClients {
  const factory CoinsMarket(
          String date, String sort, String? category, String vsCurrency) =
      _$CoinsMarket;
  const CoinsMarket._() : super._();

  String get date => throw _privateConstructorUsedError;
  String get sort => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String get vsCurrency => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinsMarketCopyWith<CoinsMarket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinsIDCopyWith<$Res> {
  factory $CoinsIDCopyWith(CoinsID value, $Res Function(CoinsID) then) =
      _$CoinsIDCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? localization,
      String? tickers,
      String? marketdata,
      String? communitydata,
      String? developerdata,
      String? sparkline});
}

/// @nodoc
class _$CoinsIDCopyWithImpl<$Res> extends _$NetworkClientsCopyWithImpl<$Res>
    implements $CoinsIDCopyWith<$Res> {
  _$CoinsIDCopyWithImpl(CoinsID _value, $Res Function(CoinsID) _then)
      : super(_value, (v) => _then(v as CoinsID));

  @override
  CoinsID get _value => super._value as CoinsID;

  @override
  $Res call({
    Object? id = freezed,
    Object? localization = freezed,
    Object? tickers = freezed,
    Object? marketdata = freezed,
    Object? communitydata = freezed,
    Object? developerdata = freezed,
    Object? sparkline = freezed,
  }) {
    return _then(CoinsID(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localization: localization == freezed
          ? _value.localization
          : localization // ignore: cast_nullable_to_non_nullable
              as String?,
      tickers: tickers == freezed
          ? _value.tickers
          : tickers // ignore: cast_nullable_to_non_nullable
              as String?,
      marketdata: marketdata == freezed
          ? _value.marketdata
          : marketdata // ignore: cast_nullable_to_non_nullable
              as String?,
      communitydata: communitydata == freezed
          ? _value.communitydata
          : communitydata // ignore: cast_nullable_to_non_nullable
              as String?,
      developerdata: developerdata == freezed
          ? _value.developerdata
          : developerdata // ignore: cast_nullable_to_non_nullable
              as String?,
      sparkline: sparkline == freezed
          ? _value.sparkline
          : sparkline // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CoinsID extends CoinsID {
  _$CoinsID(this.id,
      {this.localization,
      this.tickers,
      this.marketdata,
      this.communitydata,
      this.developerdata,
      this.sparkline})
      : super._();

  @override
  final String id;
  @override
  final String? localization;
  @override
  final String? tickers;
  @override
  final String? marketdata;
  @override
  final String? communitydata;
  @override
  final String? developerdata;
  @override
  final String? sparkline;

  @override
  String toString() {
    return 'NetworkClients.coinsID(id: $id, localization: $localization, tickers: $tickers, marketdata: $marketdata, communitydata: $communitydata, developerdata: $developerdata, sparkline: $sparkline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CoinsID &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.localization, localization) ||
                const DeepCollectionEquality()
                    .equals(other.localization, localization)) &&
            (identical(other.tickers, tickers) ||
                const DeepCollectionEquality()
                    .equals(other.tickers, tickers)) &&
            (identical(other.marketdata, marketdata) ||
                const DeepCollectionEquality()
                    .equals(other.marketdata, marketdata)) &&
            (identical(other.communitydata, communitydata) ||
                const DeepCollectionEquality()
                    .equals(other.communitydata, communitydata)) &&
            (identical(other.developerdata, developerdata) ||
                const DeepCollectionEquality()
                    .equals(other.developerdata, developerdata)) &&
            (identical(other.sparkline, sparkline) ||
                const DeepCollectionEquality()
                    .equals(other.sparkline, sparkline)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(localization) ^
      const DeepCollectionEquality().hash(tickers) ^
      const DeepCollectionEquality().hash(marketdata) ^
      const DeepCollectionEquality().hash(communitydata) ^
      const DeepCollectionEquality().hash(developerdata) ^
      const DeepCollectionEquality().hash(sparkline);

  @JsonKey(ignore: true)
  @override
  $CoinsIDCopyWith<CoinsID> get copyWith =>
      _$CoinsIDCopyWithImpl<CoinsID>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String date, String sort, String? category, String vsCurrency)
        coinsMarket,
    required TResult Function(
            String id,
            String? localization,
            String? tickers,
            String? marketdata,
            String? communitydata,
            String? developerdata,
            String? sparkline)
        coinsID,
    required TResult Function(
            String id, String vsCurrency, String days, String interval)
        martketChart,
  }) {
    return coinsID(id, localization, tickers, marketdata, communitydata,
        developerdata, sparkline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String date, String sort, String? category, String vsCurrency)?
        coinsMarket,
    TResult Function(
            String id,
            String? localization,
            String? tickers,
            String? marketdata,
            String? communitydata,
            String? developerdata,
            String? sparkline)?
        coinsID,
    TResult Function(
            String id, String vsCurrency, String days, String interval)?
        martketChart,
    required TResult orElse(),
  }) {
    if (coinsID != null) {
      return coinsID(id, localization, tickers, marketdata, communitydata,
          developerdata, sparkline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoinsMarket value) coinsMarket,
    required TResult Function(CoinsID value) coinsID,
    required TResult Function(MarketChart value) martketChart,
  }) {
    return coinsID(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoinsMarket value)? coinsMarket,
    TResult Function(CoinsID value)? coinsID,
    TResult Function(MarketChart value)? martketChart,
    required TResult orElse(),
  }) {
    if (coinsID != null) {
      return coinsID(this);
    }
    return orElse();
  }
}

abstract class CoinsID extends NetworkClients {
  factory CoinsID(String id,
      {String? localization,
      String? tickers,
      String? marketdata,
      String? communitydata,
      String? developerdata,
      String? sparkline}) = _$CoinsID;
  CoinsID._() : super._();

  String get id => throw _privateConstructorUsedError;
  String? get localization => throw _privateConstructorUsedError;
  String? get tickers => throw _privateConstructorUsedError;
  String? get marketdata => throw _privateConstructorUsedError;
  String? get communitydata => throw _privateConstructorUsedError;
  String? get developerdata => throw _privateConstructorUsedError;
  String? get sparkline => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinsIDCopyWith<CoinsID> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketChartCopyWith<$Res> {
  factory $MarketChartCopyWith(
          MarketChart value, $Res Function(MarketChart) then) =
      _$MarketChartCopyWithImpl<$Res>;
  $Res call({String id, String vsCurrency, String days, String interval});
}

/// @nodoc
class _$MarketChartCopyWithImpl<$Res> extends _$NetworkClientsCopyWithImpl<$Res>
    implements $MarketChartCopyWith<$Res> {
  _$MarketChartCopyWithImpl(
      MarketChart _value, $Res Function(MarketChart) _then)
      : super(_value, (v) => _then(v as MarketChart));

  @override
  MarketChart get _value => super._value as MarketChart;

  @override
  $Res call({
    Object? id = freezed,
    Object? vsCurrency = freezed,
    Object? days = freezed,
    Object? interval = freezed,
  }) {
    return _then(MarketChart(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vsCurrency == freezed
          ? _value.vsCurrency
          : vsCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as String,
      interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarketChart extends MarketChart {
  _$MarketChart(this.id, this.vsCurrency, this.days, this.interval) : super._();

  @override
  final String id;
  @override
  final String vsCurrency;
  @override
  final String days;
  @override
  final String interval;

  @override
  String toString() {
    return 'NetworkClients.martketChart(id: $id, vsCurrency: $vsCurrency, days: $days, interval: $interval)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MarketChart &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.vsCurrency, vsCurrency) ||
                const DeepCollectionEquality()
                    .equals(other.vsCurrency, vsCurrency)) &&
            (identical(other.days, days) ||
                const DeepCollectionEquality().equals(other.days, days)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(vsCurrency) ^
      const DeepCollectionEquality().hash(days) ^
      const DeepCollectionEquality().hash(interval);

  @JsonKey(ignore: true)
  @override
  $MarketChartCopyWith<MarketChart> get copyWith =>
      _$MarketChartCopyWithImpl<MarketChart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String date, String sort, String? category, String vsCurrency)
        coinsMarket,
    required TResult Function(
            String id,
            String? localization,
            String? tickers,
            String? marketdata,
            String? communitydata,
            String? developerdata,
            String? sparkline)
        coinsID,
    required TResult Function(
            String id, String vsCurrency, String days, String interval)
        martketChart,
  }) {
    return martketChart(id, vsCurrency, days, interval);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String date, String sort, String? category, String vsCurrency)?
        coinsMarket,
    TResult Function(
            String id,
            String? localization,
            String? tickers,
            String? marketdata,
            String? communitydata,
            String? developerdata,
            String? sparkline)?
        coinsID,
    TResult Function(
            String id, String vsCurrency, String days, String interval)?
        martketChart,
    required TResult orElse(),
  }) {
    if (martketChart != null) {
      return martketChart(id, vsCurrency, days, interval);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoinsMarket value) coinsMarket,
    required TResult Function(CoinsID value) coinsID,
    required TResult Function(MarketChart value) martketChart,
  }) {
    return martketChart(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoinsMarket value)? coinsMarket,
    TResult Function(CoinsID value)? coinsID,
    TResult Function(MarketChart value)? martketChart,
    required TResult orElse(),
  }) {
    if (martketChart != null) {
      return martketChart(this);
    }
    return orElse();
  }
}

abstract class MarketChart extends NetworkClients {
  factory MarketChart(
          String id, String vsCurrency, String days, String interval) =
      _$MarketChart;
  MarketChart._() : super._();

  String get id => throw _privateConstructorUsedError;
  String get vsCurrency => throw _privateConstructorUsedError;
  String get days => throw _privateConstructorUsedError;
  String get interval => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketChartCopyWith<MarketChart> get copyWith =>
      throw _privateConstructorUsedError;
}
