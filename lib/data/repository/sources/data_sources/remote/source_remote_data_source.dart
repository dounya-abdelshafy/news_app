//todo: interface source remote data source (ds) => online
import 'package:news_app/model/source_response.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getNewsSources(String categoryId);
}
