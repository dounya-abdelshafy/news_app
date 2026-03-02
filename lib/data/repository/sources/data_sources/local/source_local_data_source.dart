//todo: interface source local data source (ds) => offline
import 'package:news_app/model/source_response.dart';

abstract class SourceLocalDataSource {
  Future<SourceResponse?> getSources(String categoryId);

  void saveSources(SourceResponse? sourceResponse , String categoryId);
}
