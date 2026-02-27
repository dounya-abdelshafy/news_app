import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category_details/sources/source_tab_widget.dart';
import 'package:news_app/ui/home/category_details/sources/sources_view_model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel categoryModel;

  CategoryDetails({super.key, required this.categoryModel});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourcesViewModel viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    viewModel.getSources(widget.categoryModel.id);

  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            //todo: error
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

                      viewModel.getSources(widget.categoryModel.id);
                      setState(() {});
                      // ApiManager.getNewsSources(widget.categoryModel.id);
                      // setState(() {});
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
          } else if (viewModel.sourcesList == null) {
            //todo: sourcesList == null => mean the probability of loading
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.greyColor,
              ),
            );
          } else {
            //todo: success
            return SourceTabWidget(sourcesList: viewModel.sourcesList!);
          }
        },
      ),
      // FutureBuilder<SourceResponse?>(
      //   future: ApiManager.getNewsSources(widget.categoryModel.id),
      //   builder: (context, snapshot) {
      //     //todo: the probability of loading
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           backgroundColor: AppColors.greyColor,
      //         ),
      //       );
      //     }
      //     //todo: the probability of error from => client 'developer'
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
      //                 ApiManager.getNewsSources(widget.categoryModel.id);
      //                 setState(() {});
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
      //     if (snapshot.data?.status == 'error') {
      //       return Padding(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: width * 0.05,
      //           vertical: height * 0.05,
      //         ),
      //         child: Column(
      //           children: [
      //             SizedBox(height: height * 0.25),
      //             Text(
      //               snapshot.data!.message!,
      //               style: Theme.of(context).textTheme.labelMedium,
      //             ),
      //             SizedBox(height: height * 0.02),
      //             ElevatedButton(
      //               onPressed: () {
      //                 ApiManager.getNewsSources(widget.categoryModel.id);
      //                 setState(() {});
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
      //     var sourceList = snapshot.data?.sources ?? [];
      //     return SourceTabWidget(sourcesList: sourceList);
      //   },
      // ),
    );
  }
}