import 'package:coin_dino/features/search/data/data_sources/contracts/i_search_remote_data_source.dart';
import 'package:coin_dino/features/search/data/model/search_trend_model.dart';

class SearchRemoteDataSource implements ISearchRemoteDataSource{
  @override
  Future<SearchTrendModel> getAllTrends() {
    // TODO: implement getAllTrends SERCAN -- Throw edilecek error: SearchException.trendsFetchingException()
    throw UnimplementedError();
  }

}