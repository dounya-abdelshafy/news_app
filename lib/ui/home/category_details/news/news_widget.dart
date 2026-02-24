import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category_details/news/news_item.dart';
import 'package:news_app/ui/home/category_details/news/news_view_model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../model/source_response.dart';

class NewsWidget extends StatefulWidget {
  Sources source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            //todo: error => client
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.25),
                  Text(
                    viewModel.errorMessage!,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsBySourceId(widget.source.id ?? '');
                      setState(() {});
                      // ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyColor,
                    ),
                    child: Text(
                      'Try Again.',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            );
          } else if (viewModel.newsList == null) {
            //todo: loading
            return Center(
              child: CircularProgressIndicator(color: AppColors.greyColor),
            );
          } else {
            //todo: success
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: height * 0.02);
                },
                itemBuilder: (context, index) {
                  return NewsItem(news: viewModel.newsList![index]);
                },
                itemCount: viewModel.newsList!.length,
              ),
            );
          }
        },
      ),
      // FutureBuilder<NewsResponse?>(
      //   future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
      //   builder: (context, snapshot) {
      //     //todo: loading
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(color: AppColors.greyColor),
      //       );
      //     }
      //     //todo: error => client
      //     else if (snapshot.hasError) {
      //       return Padding(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: width * 0.05,
      //           vertical: height * 0.05,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             SizedBox(height: height * 0.25),
      //             Text(
      //               'Something went wrong.',
      //               style: Theme.of(context).textTheme.labelMedium,
      //               textAlign: TextAlign.center,
      //             ),
      //             SizedBox(height: height * 0.02),
      //             ElevatedButton(
      //               onPressed: () {
      //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: AppColors.greyColor,
      //               ),
      //               child: Text(
      //                 'Try Again.',
      //                 style: Theme.of(context).textTheme.labelMedium,
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      //     //todo: server response => success , error
      //     //todo: server response => error
      //     if(snapshot.data?.status == 'error') {
      //       return Padding(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: width * 0.05,
      //           vertical: height * 0.05,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             SizedBox(height: height * 0.25),
      //             Text(
      //               snapshot.data?.message ?? 'Something went wrong',
      //               style: Theme.of(context).textTheme.labelMedium,
      //               textAlign: TextAlign.center,
      //             ),
      //             SizedBox(height: height * 0.02),
      //             ElevatedButton(
      //               onPressed: () {
      //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: AppColors.greyColor,
      //               ),
      //               child: Text(
      //                 'Try Again.',
      //                 style: Theme.of(context).textTheme.labelMedium,
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      //     //todo: server response => success
      //     var newsList = snapshot.data?.articles ?? [];
      //     return Expanded(
      //       child: ListView.separated(
      //         separatorBuilder: (context, index) {
      //           return SizedBox(height: height * 0.02,);
      //         },
      //         itemBuilder: (context, index) {
      //         return NewsItem(news: newsList[index]);
      //       },
      //       itemCount: newsList.length,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}