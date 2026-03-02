//todo: impl => source local ds
import 'package:hive/hive.dart';
import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app/model/source_response.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var box = await Hive.openBox('SourcesTap');
    var sourceResponse = box.get(categoryId);
    return sourceResponse;
    // return SourceResponse.fromJson(box.get(categoryId));//todo: map => obj => solution without adapter
  }

  @override
  void saveSources(SourceResponse? sourceResponse , String categoryId) async {
    var box = await Hive.openBox('SourcesTap');
    await box.put(categoryId, sourceResponse);
    // await box.put(categoryId, sourceResponse?.toJson()); //todo: obj => map => solution without adapter
    await box.close();
  }
}