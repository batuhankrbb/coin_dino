import 'package:coin_dino/features/market/data/models/market_coin_category.model.dart';

abstract class ILocalMarketDataSource{
   Future<List<MarketCoinCategoryModel>> getAllCategories();
}