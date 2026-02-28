//todo: interface news local ds
import 'package:news_app/model/news_response.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}