import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category_fragment/widgets/category_item.dart';

typedef OnCategoryItemClick = Function(CategoryModel);

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoriesList = [];
  OnCategoryItemClick onCategoryItemClick;
  CategoryFragment({super.key , required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    categoriesList = CategoryModel.getCategoriesList(true);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                     //todo: show category details
                    onCategoryItemClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                    categoryModel: categoriesList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
