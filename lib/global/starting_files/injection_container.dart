import 'package:get_it/get_it.dart';

import '../../features/alert/data/data_source/contracts/i_alert_local_data_source.dart';
import '../../features/alert/data/data_source/contracts/i_alert_remote_data_source.dart';
import '../../features/alert/data/data_source/implementations/alert_local_data_source.dart';
import '../../features/alert/data/data_source/implementations/alert_remote_data_source.dart';
import '../../features/alert/data/exception_handling/exception_handler.dart';
import '../../features/alert/data/repository/alert_repository.dart';
import '../../features/alert/domain/repository_contract/i_alert_repository.dart';
import '../../features/details/data/data_source/contracts/i_details_remote_data_source.dart';
import '../../features/details/data/data_source/implementations/details_remote_data_source.dart';
import '../../features/details/data/exception_handling/details_exception_handler.dart';
import '../../features/details/data/repository/coin_detail_repository.dart';
import '../../features/details/domain/repository_contract/i_coin_detail_repository.dart';
import '../../features/market/data/data_source/contracts/i_market_local_data_source.dart';
import '../../features/market/data/data_source/contracts/i_market_remote_data_source.dart';
import '../../features/market/data/data_source/implementations/market_local_data_source.dart';
import '../../features/market/data/data_source/implementations/market_remote_data_source.dart';
import '../../features/market/data/exception_handling/market_exception_handler.dart';
import '../../features/market/data/repository/market_coin_repository.dart';
import '../../features/market/domain/repository_contracts/i_market_coin_repository.dart';
import '../../features/preferences/data/contracts/i_preferences_local_data_source.dart';
import '../../features/preferences/data/exception_handling/exception_handler.dart';
import '../../features/preferences/data/implementations/preferences_local_data_source.dart';
import '../../features/preferences/data/repository/preference_repository.dart';
import '../../features/preferences/domain/repository_contract/i_preference_repository.dart';
import '../../features/search/data/data_sources/contracts/i_search_remote_data_source.dart';
import '../../features/search/data/data_sources/implementations/search_remote_data_source.dart';
import '../../features/search/data/exception_handling/exception_handler.dart';
import '../../features/search/data/repository/search_repository.dart';
import '../../features/search/domain/repository_contract/i_search_repository.dart';
import '../app_settings/app_settings_viewmodel.dart';

GetIt getit = GetIt.instance;

void setupGetIt() {
  _setUpAlertFeature();
  _setUpMarketFeature();
  _setUpDetailsFeature();
  _setUpPreferencesFeature();
  _setUpSearchFeature();
  _setupAppSettings();
}

void _setUpAlertFeature() {
  getit.registerLazySingleton<IAlertRepository>(() => AlertRepository(
      localDataSource: getit(),
      remoteDataSource: getit(),
      exceptionHandler: getit(),
      preferencesLocalDataSource: getit()));

  getit.registerLazySingleton<IAlertLocalDataSource>(
      () => AlertLocalDataSource());

  getit.registerLazySingleton<IAlertRemoteDataSource>(
      () => AlertRemoteDataSource());

  getit.registerLazySingleton<AlertExceptionHandler>(
      () => AlertExceptionHandler());
}

void _setUpMarketFeature() {
  getit.registerLazySingleton<IMarketCoinRepository>(() => MarketCoinRepository(
      marketLocalDataSource: getit(),
      marketRemoteDataSource: getit(),
      exceptionHandler: getit(),
      preferencesLocalDataSource: getit()));

  getit.registerLazySingleton<IMarketLocalDataSource>(
      () => MarketLocalDataSource());

  getit.registerLazySingleton<IMarketRemoteDataSource>(
      () => MarketRemoteDataSource());

  getit.registerLazySingleton<MarketExceptionHandler>(
      () => MarketExceptionHandler());
}

void _setUpDetailsFeature() {
  getit.registerLazySingleton<ICoinDetailRepository>(() => CoinDetailRepository(
      remoteDataSource: getit(),
      exceptionHandler: getit(),
      preferencesLocalDataSource: getit()));

  getit.registerLazySingleton<IDetailsRemoteDataSource>(
      () => DetailsRemoteDataSource());

  getit.registerLazySingleton<DetailsExceptionHandler>(
      () => DetailsExceptionHandler());
}

void _setUpPreferencesFeature() {
  getit.registerLazySingleton<IPreferenceRepository>(
    () => PreferenceRepository(
      preferencesLocalDataSource: getit(),
      exceptionHandler: getit(),
    ),
  );

  getit.registerLazySingleton<IPreferencesLocalDataSource>(
      () => PreferencesLocalDataSource());

  getit.registerLazySingleton<PreferencesExceptionHandler>(
      () => PreferencesExceptionHandler());
}

void _setUpSearchFeature() {
  getit.registerLazySingleton<ISearchRepository>(
    () => SearchRepository(
      remoteDataSource: getit(),
      exceptionHandler: getit(),
    ),
  );

  getit.registerLazySingleton<ISearchRemoteDataSource>(
      () => SearchRemoteDataSource());

  getit.registerLazySingleton<SearchExceptionHandler>(
      () => SearchExceptionHandler());
}

void _setupAppSettings() {
  getit.registerLazySingleton<AppSettingsViewModel>(() => AppSettingsViewModel());
}