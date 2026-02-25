import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/category_details/sources/sources_cubit/sources_state.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  SourcesViewModel() : super(SourcesLoadingState());

  //todo: hold data - handle logic

  //todo: data
  // List<Sources>? sourcesList;
  // String? errorMessage;

  //todo: logic
  void getSources(String categoryId) async {
    try {
      //todo: state -> loading
      emit(SourcesLoadingState());
      var response = await ApiManager.getNewsSources(categoryId);
      if(response?.status == 'error') {
        //todo: server => error
        //todo: state -> error
        emit(SourcesErrorState(errorMessage: response!.message!));
      } else if(response?.status == 'ok') {
        //todo: server => success
        //todo: state -> success
        emit(SourcesSuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      emit(SourcesErrorState(errorMessage: e.toString()));
    }
  }
}
