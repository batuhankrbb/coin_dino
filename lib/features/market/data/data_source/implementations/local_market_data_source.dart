import 'package:coin_dino/features/market/data/data_source/contracts/i_local_market_data_source.dart';
import 'package:coin_dino/features/market/data/models/market_coin_category.model.dart';

class LocalMarketDataSource implements ILocalMarketDataSource{
  @override
  Future<List<MarketCoinCategoryModel>> getAllCategories() {
    // TODO: implement getAllCategories SERCAN -- exception atarken atacağımız exceptionu yazıyoruz MarketExceptionsa. Sonra handler tarafında ele alıyoruz daha sonra burada throw MarketExceptions.noInternet vb yapıyoruz. Bu tüm implementationlar için geçerli
    throw UnimplementedError();
  }

}