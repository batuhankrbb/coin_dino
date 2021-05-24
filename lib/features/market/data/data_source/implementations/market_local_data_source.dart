import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../../models/market_coin_category.model.dart';
import '../contracts/i_market_local_data_source.dart';

class MarketLocalDataSource implements IMarketLocalDataSource {
  @override
  Future<List<MarketCoinCategoryModel>> getAllCategories() async {
    final String localJsonPath = 'assets/json/crypto_categories.json';
    var localData = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(localData);
    var categoryList =
        decodedJson.map((e) => MarketCoinCategoryModel.fromJson(e)).toList();
    return categoryList;
  }
}
