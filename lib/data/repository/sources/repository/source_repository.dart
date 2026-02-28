//todo: interface repository => abstract class
import 'package:news_app/model/source_response.dart';

abstract class SourceRepository {
  Future<SourceResponse?> getNewsSources(String categoryId);
}