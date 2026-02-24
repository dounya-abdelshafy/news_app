import 'package:flutter/material.dart';
import '../../../../utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  String icon;
  String title;

  DrawerItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      child: Row(
        children: [
          Image.asset(icon),
          SizedBox(width: width * 0.02),
          Text(title, style: AppStyles.bold20White),
        ],
      ),
    );
  }
}
