import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/ui/home/category_details/news/news_cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsRepository newsRepository;

  // late NewsRemoteDataSource remoteDataSource;
  // late ApiManager apiManager;
  NewsViewModel({required this.newsRepository}) : super(NewsLoadingState());

  // {
  //   apiManager = ApiManager();
  //   remoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
  //  newsRepository = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  // }

  //todo: hold data - handle logic

  void getNewsBySourceId(String sourceId) async {
    try {
      var response = await newsRepository.getNewsBySourceId(sourceId);
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
