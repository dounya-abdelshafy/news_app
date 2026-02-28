//todo: impl => news repository
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/model/news_response.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    // TODO: implement getNewsBySourceId
    throw UnimplementedError();
  }

  // @override
  // Future<NewsResponse?> getNewsBySourceId(String sourceId) {
  //   return remoteDataSource.getNewsBySourceId(sourceId);
  // }
}
