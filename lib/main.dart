import 'package:coin_dino/core/hive/hive_helper.dart';
import 'package:coin_dino/features/alert/data/data_source/implementations/alert_local_data_source.dart';
import 'package:coin_dino/features/alert/data/data_source/implementations/alert_remote_data_source.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exceptions/alert_exceptions.dart';
import 'package:coin_dino/features/alert/data/repository/alert_repository.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/features/alert/domain/repository_contract/i_alert_repository.dart';

import 'package:coin_dino/features/preferences/data/implementations/preferences_local_data_source.dart';
import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/features/preferences/domain/repository_contract/i_preference_repository.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
  await HiveHelper.shared.setUpHive();
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(scaffoldBackgroundColor: Colors.red),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IAlertRepository alertRepo = AlertRepository(
      localDataSource: AlertLocalDataSource(),
      exceptionHandler: AlertExceptionHandler(),
      remoteDataSource: AlertRemoteDataSource(),
      preferencesLocalDataSource: PreferencesLocalDataSource());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                var alerts = await alertRepo.getAllAlerts();
                alerts.when(success: (data) {
                  print("success ${data.length}");
                  alertRepo.deleteAlert(data[0]);
                }, failure: (failure) {
                  print("failure ${failure.message}");
                });

                  var alerts2 = await alertRepo.getAllAlerts();
                alerts2.when(success: (data) {
                  print("success ${data.length}");
                }, failure: (failure) {
                  print("failure ${failure.message}");
                });
              },
              child: Text("get currency preference"))
        ],
      ),
    );
  }
}

/* * *
  Future<Result<ThemePreferenceEntity>> getThemePreference();
   var themepreference =
                    await preferenceRepository.getThemePreference();
                themepreference.when(success: (data) {
                  print("success ${data.toString()}");
                }, failure: (failure) {
                  print("failure ${failure.message}");
                });

               var result = await preferenceRepository
                    .setThemePreference(ThemePreferenceEntity.dark);
                result.when(success: (_) {
                  print("success result");
                }, failure: (fail) {
                  print("fail ${fail.message}");
                });


  Future<Result<LanguagePreferenceEntity>> getLanguagePreference();
  Future<Result<String>> getBaseCurrencyPreference();
  Future<Result<void>> setThemePreference(ThemePreferenceEntity themePreference);
  Future<Result<void>> setLangaugePreference(LanguagePreferenceEntity languagePreference);
  Future<Result<void>> setBaseCurrencyPreference(String baseCurrency);
  Future<Result<List<String>>> getAllSupportedBaseCurrencies();
 **/
