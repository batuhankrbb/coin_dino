import 'dart:convert';
import '../contracts/i_market_local_data_source.dart';
import '../../models/market_coin_category.model.dart';
import 'package:flutter/services.dart' show rootBundle;

class MarketLocalDataSource implements IMarketLocalDataSource {
  @override
  Future<List<MarketCoinCategoryModel>> getAllCategories() async {
    final String localJsonPath = 'assets/json/crypto_categories.json';
    var localData = await rootBundle.loadString(localJsonPath);
    List<MarketCoinCategoryModel> categoryList = json.decode(localData);
    return categoryList;
  }
}
