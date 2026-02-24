import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem({super.key, required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: (index % 2 == 0)
          ? Alignment.bottomRight
          : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: Image.asset(categoryModel.image),
        ),
        Container(
          width: width * 0.39,
          padding: EdgeInsetsDirectional.only(
            start: (index % 2 == 0) ? width * 0.04 : 0,
            end: (index % 2 == 0) ? 0 : width * 0.04,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.04,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(84),
            color: AppColors.greyColor,
          ),
          child: Row(
            textDirection: (index % 2 == 0)
                ? TextDirection.ltr
                : TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'View All',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              CircleAvatar(
                radius: 27,
                backgroundColor: Theme.of(context).primaryColor,
                child: (index % 2 == 0)
                    ? Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).indicatorColor,
                      )
                    : Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Theme.of(context).indicatorColor,
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
