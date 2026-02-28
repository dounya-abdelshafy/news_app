//todo: interface news remote ds
import 'package:news_app/model/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}