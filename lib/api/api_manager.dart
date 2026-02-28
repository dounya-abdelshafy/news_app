import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager {
   Future<SourceResponse?> getNewsSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.serverName, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category' : categoryId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response
          .body; //todo: body = String ' I'm waiting for json not String '
      //todo: exchange String => json
      var json = jsonDecode(responseBody);
      //todo: exchange json => object
      return SourceResponse.fromJson(json);

      ///todo: we can express all this 'try, catch' in one line:
      ///SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
    // var response = await http.get(url);
    // var responseBody = response.body;   //todo: body = String ' I'm waiting for json not String '
    // //todo: exchange String => json
    // var json = jsonDecode(responseBody);
    // //todo: exchange json => object
    // return SourceResponse.fromJson(json);
    // //todo: all the previous code could make error when the connection to the server failed so there is no response.
    // //todo: we will put it into try , catch
  }

   Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.serverName, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body; //todo: string
      var json = jsonDecode(responseBody); //todo: string => json
      return NewsResponse.fromJson(json); //todo: json => object
    } catch (e) {
      throw e;
    }
  }
}

/*
https://newsapi.org/v2/top-headlines/sources?apiKey=385532f1507046ff9bc201196fd99c09
*/

/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=385532f1507046ff9bc201196fd99c09
*/
