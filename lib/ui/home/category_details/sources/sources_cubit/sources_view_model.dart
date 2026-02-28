import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news_app/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/ui/home/category_details/sources/sources_cubit/sources_state.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
   SourceRepository sourceRepository;
   //todo: comment it to apply DI concept as this loads more dependencies in view model and it only need an obj from it's repository
  // late SourceRemoteDataSource remoteDataSource;
  // late ApiManager apiManager;

  SourcesViewModel({required this.sourceRepository}) : super(SourcesLoadingState());
  // {
  //   apiManager = ApiManager();
  //   remoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
  //   sourceRepository = SourceRepositoryImpl(remoteDataSource: remoteDataSource);
  // }

  //todo: hold data - handle logic

  //todo: data
  // List<Sources>? sourcesList;
  // String? errorMessage;

  //todo: logic
  void getSources(String categoryId) async {
    try {
      //todo: state -> loading
      emit(SourcesLoadingState());
      var response = await sourceRepository.getNewsSources(categoryId);
      if (response?.status == 'error') {
        //todo: server => error
        //todo: state -> error
        emit(SourcesErrorState(errorMessage: response!.message!));
      } else if (response?.status == 'ok') {
        //todo: server => success
        //todo: state -> success
        emit(SourcesSuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      emit(SourcesErrorState(errorMessage: e.toString()));
    }
  }
}
