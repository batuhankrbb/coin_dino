import '../../../../core/network/network_fetching/base_network_model.dart';
import '../../domain/entities/market_coin_category_entity.dart';

class MarketCoinCategoryModel extends BaseNetworkModel{
  MarketCoinCategoryModel({
    required this.categoryId,
    required this.name,
  });

  final String categoryId;
  final String name;
     

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
      } ;

  MarketCoinCategoryEntity toEntity() {
    return MarketCoinCategoryEntity(categoryID: categoryId, categoryName: name);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return  MarketCoinCategoryModel(
        categoryId: json["category_id"],
        name: json["name"],
      );
  }
}
