import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/widget/app_config_bottom_sheet.dart';
import 'package:news_app/ui/home/drawer/widget/drawer_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/assets_manager.dart';


class HomeDrawer extends StatelessWidget {
  VoidCallback onDrawerClick;
  HomeDrawer({super.key , required this.onDrawerClick});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: AppColors.blackColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: height * 0.25,
            color: AppColors.whiteColor,
            child: Text('News App' , style: AppStyles.bold24Black,),
          ),
          SizedBox(height: height * 0.01,),
          InkWell(
              onTap: () {
                //todo: navigate to home screen
                // Navigator.pushNamed(context, AppRoutes.homeRouteName);
                //todo: navigate to home screen without navigation (using callBackFunc)
                onDrawerClick();
              },
              child: DrawerItem(icon: AssetsManager.homeIcon, title: 'Go To Home')),
          Divider(
            indent: width * 0.05,
            endIndent: width * 0.05,
            thickness: 1.5,
          ),
          DrawerItem(icon: AssetsManager.themeIcon, title: 'Theme'),
          SizedBox(height: height * 0.005,),
          AppConfigBottomSheet(title: 'Dark'),
          SizedBox(height: height * 0.015,),
          Divider(
            indent: width * 0.05,
            endIndent: width * 0.05,
            thickness: 1.5,
          ),
          DrawerItem(icon: AssetsManager.languageIcon, title: 'Language'),
          SizedBox(height: height * 0.01,),
          AppConfigBottomSheet(title: 'English'),

        ],
      ),
    );
  }
}
