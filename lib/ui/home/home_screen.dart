import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category_details/sources/sources_details.dart';
import 'package:news_app/ui/home/category_fragment/category_fragment.dart';
import 'package:news_app/ui/home/drawer/home_drawer.dart';
import 'package:news_app/utils/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Image.asset(AssetsManager.searchIconDark),
          ),
        ],
      ),
      drawer: Drawer(child: HomeDrawer(onDrawerClick: onDrawerClick)),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : SourcesDetails(categoryModel: selectedCategory!),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClick(CategoryModel newSelectedCategory) {
    //todo: newSelectedCategory => by user
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}