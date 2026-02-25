import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/category_details/news/news_cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsViewModel() : super(NewsLoadingState());

  //todo: hold data - handle logic

  void getNewsBySourceId(String sourceId) async {
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      //todo: loading
      emit(NewsLoadingState());
      //todo: error => server
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }
      //todo: success
      if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));
        return;
      }
    } catch (e) {
      //todo: error => client
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
