import 'package:news_app/utils/assets_manager.dart';

class CategoryModel {
  String id;
  String title;
  String image;

  CategoryModel({required this.id, required this.title, required this.image});

  static List<CategoryModel> getCategoriesList(bool isDark) {
    return [
      CategoryModel(
        id: 'general',
        title: 'General',
        image: isDark
            ? AssetsManager.generalLightImage
            : AssetsManager.generalDarkImage,

      ),
      CategoryModel(
        id: 'business',
        title: 'Business',
        image: isDark
            ? AssetsManager.businessLightImage
            : AssetsManager.businessDarkImage,

      ),
      CategoryModel(
        id: 'sports',
        title: 'Sports',
        image: isDark
            ? AssetsManager.sportLightImage
            : AssetsManager.sportDarkImage,

      ),
      CategoryModel(
        id: 'technology',
        title: 'Technology',
        image: isDark
            ? AssetsManager.technologyLightImage
            : AssetsManager.technologyDarkImage,

      ),
      CategoryModel(
        id: 'science',
        title: 'Science',
        image: isDark
            ? AssetsManager.scienceLightImage
            : AssetsManager.scienceDarkImage,

      ),
      CategoryModel(
        id: 'health',
        title: 'Health',
        image: isDark
            ? AssetsManager.healthLightImage
            : AssetsManager.healthDarkImage,

      ),
      CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        image: isDark
            ? AssetsManager.entertainmentLightImage
            : AssetsManager.entertainmentDarkImage,

      ),
    ];
  }
}

