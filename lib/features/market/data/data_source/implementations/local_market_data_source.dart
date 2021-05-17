import 'dart:convert';
import 'package:coin_dino/features/market/data/data_source/contracts/i_local_market_data_source.dart';
import 'package:coin_dino/features/market/data/models/market_coin_category.model.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocalMarketDataSource implements ILocalMarketDataSource {
  @override
  Future<List<MarketCoinCategoryModel>> getAllCategories() async {
    final String localJsonPath = 'assets/json/crypto_categories.json';
    var localData = await rootBundle.loadString(localJsonPath);
    List<MarketCoinCategoryModel> categoryList = json.decode(localData);
    return categoryList;
  }
}
