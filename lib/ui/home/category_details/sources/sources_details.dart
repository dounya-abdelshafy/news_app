import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category_details/sources/source_tab_widget.dart';
import 'package:news_app/ui/home/category_details/sources/sources_cubit/sources_state.dart';
import 'package:news_app/ui/home/category_details/sources/sources_cubit/sources_view_model.dart';
import 'package:news_app/utils/app_colors.dart';
import '../../../../api/api_manager.dart';


class SourcesDetails extends StatefulWidget {
  CategoryModel categoryModel;

  SourcesDetails({super.key, required this.categoryModel});

  @override
  State<SourcesDetails> createState() => _SourcesDetailsState();
}


class _SourcesDetailsState extends State<SourcesDetails> {
  SourcesViewModel viewModel = SourcesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.categoryModel.id);
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider<SourcesViewModel>(
      create: (context) => viewModel,
      child: BlocBuilder<SourcesViewModel, SourcesStates>(
        // bloc: viewModel, //todo: when using 'BlocProvider<SourcesViewModel>' we can't use bloc but when? ... => in the last line
        builder: (context, state) {
          if (state is SourcesLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.greyColor,
              ),
            );
          } else if (state is SourcesErrorState) {
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
                    state.errorMessage,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsSources(widget.categoryModel.id);

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
          } else if (state is SourcesSuccessState) {
            return SourceTabWidget(sourcesList: state.sourcesList);
          }
          return Container(); //todo: unreachable
        },
      ),
    );

    //   FutureBuilder<SourceResponse?>(
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
    // );
  }
}

//todo: We can use the parameter bloc when the bloc(viewModel) used in one screen ,
//todo:   but when the bloc is shared on tha app we will use 'BlocProvider<SourcesViewModel>'
