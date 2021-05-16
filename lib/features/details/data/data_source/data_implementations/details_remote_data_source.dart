import 'package:coin_dino/features/details/data/data_source/data_contracts/i_details_remote_data_source.dart';
import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';
import 'package:coin_dino/features/details/data/models/coins_chart_model.dart';

class DetailsRemoteDataSource implements IDetailsRemoteDataSource{
  @override
  Future<CoinChartModel> getChart(String id, String days, String vsCurrency) {
      // TODO: implement getChart SERCAN
      throw UnimplementedError();
    }
  
    @override
    Future<CoinDetailEntity> getDetails(String id) {
    // TODO: implement getDetails SERCAN
    throw UnimplementedError();
  }

}