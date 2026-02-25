import 'package:news_app/model/source_response.dart';

abstract class SourcesStates {}
class SourcesLoadingState extends SourcesStates {}
class SourcesErrorState extends SourcesStates {
  String errorMessage;
  SourcesErrorState({required this.errorMessage});
}
class SourcesSuccessState extends SourcesStates {
  List<Sources> sourcesList;
  SourcesSuccessState({required this.sourcesList});
}