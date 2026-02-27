import 'package:flutter/material.dart';
import '../../../../api/api_manager.dart';
import '../../../../model/source_response.dart';

class SourcesViewModel extends ChangeNotifier {
  //todo: hold data - handle logic
  //todo: data
  List<Sources>? sourcesList;
  String? errorMessage;

  //todo: data logic
  void getSources(String categoryId) async {
    //todo: reinitialize
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsSources(categoryId);
      if (response?.status == 'error') {
        //todo: error => from server
        errorMessage = response!.message!;
      } else {
        //todo: success
        sourcesList = response!.sources!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}