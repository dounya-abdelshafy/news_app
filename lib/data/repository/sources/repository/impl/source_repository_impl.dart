//todo: impl source repository => concrete
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/model/source_response.dart';

import '../../data_sources/remote/source_remote_data_source.dart';

//todo: impl source repository
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getNewsSources(String categoryId) async {
    var response = await remoteDataSource.getNewsSources(categoryId);
    return response;
  }

}