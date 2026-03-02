//todo: impl source repository => concrete
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/model/source_response.dart';

import '../../data_sources/remote/source_remote_data_source.dart';

//todo: impl source repository
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource;

  SourceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<SourceResponse?> getNewsSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //todo: internet => remote ds
      var sourceResponse = await remoteDataSource.getNewsSources(categoryId);
      //todo: before return we should save sourceResponse in 'cashing' to apply local ds
      localDataSource.saveSources(sourceResponse , categoryId);
      return sourceResponse;
    }
    else {
      //todo: no internet => local ds
      return localDataSource.getSources(categoryId);
    }
  }
}
