import 'package:coin_dino/features/market/domain/entities/market_coin_category_entity.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';

class MarketCoinCategoryModel {
  MarketCoinCategoryModel({
    required this.categoryId,
    required this.name,
  });

  final String categoryId;
  final String name;

  factory MarketCoinCategoryModel.fromJson(Map<String, dynamic> json) =>
      MarketCoinCategoryModel(
        categoryId: json["category_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
      };

  MarketCoinCategoryEntity toEntity() {
    return MarketCoinCategoryEntity(categoryID: categoryId, categoryName: name);
  }
}
