import 'dart:convert';

import 'package:coin_dino/core/hive/hive_helper.dart';
import 'package:coin_dino/features/preferences/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/preferences/data/implementations/preferences_local_data_source.dart';
import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/features/preferences/domain/repository_contract/i_preference_repository.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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
  IPreferenceRepository preferenceRepository = PreferenceRepository(
      preferencesLocalDataSource: PreferencesLocalDataSource(),
      exceptionHandler: PreferencesExceptionHandler());

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
                /*
 var result = await preferenceRepository
                    .setBaseCurrencyPreference("btc");
                result.when(success: (_) {
                  print("success result");
                }, failure: (fail) {
                  print("fail ${fail.message}");
                });
            
    */

                final String localJsonPath = "assets/json/vs_currency.json";
                var localData = await rootBundle.loadString(localJsonPath);
                List<String> decodedData = jsonDecode(localData);
                print(decodedData);

                var crpreference =
                    await preferenceRepository.getAllSupportedBaseCurrencies();
                crpreference.when(success: (data) {
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
