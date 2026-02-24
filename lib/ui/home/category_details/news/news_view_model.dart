import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import '../../../../model/news_response.dart';

class NewsViewModel extends ChangeNotifier {
  //todo: hold data - handle logic
  //todo: data
  List<News>? newsList;
  String? errorMessage;

  //todo: logic
  void getNewsBySourceId(String sourceId) async {
    //todo: reinitialize
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        //todo: error from server
        errorMessage = response!.message!;
      } else {
        //todo: success
        newsList = response!.articles!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
