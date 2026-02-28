import '../source_remote_data_source.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/source_response.dart';

//todo: impl source remote ds
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;
  //todo: calling constructor injection => inject an obj into constructor
  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getNewsSources(String categoryId) async {
    var response = await apiManager.getNewsSources(categoryId);
    return response;
  }
}
