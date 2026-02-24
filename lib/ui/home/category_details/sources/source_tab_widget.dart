import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category_details/news/news_widget.dart';
import 'package:news_app/ui/home/category_details/sources/source_name.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Sources> sourcesList = [];

  SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourcesList.map((sources) {
              return SourceName(
                sources: sources,
                isSelected:
                    selectedIndex == widget.sourcesList.indexOf(sources),
              );
            }).toList(),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Theme.of(context).indicatorColor,
            dividerColor: AppColors.transparentColor,
          ),
          SizedBox(height: height * 0.025),
          NewsWidget(
            source: widget.sourcesList[selectedIndex],
            key: ValueKey(widget.sourcesList[selectedIndex].id, //todo: it's a solution from chat GPT after using MVVM i've error that all the sources show the same news because when i used FutureBuilder it doesn't have a state it made request to api every time i made a change(click on sourceTab) , but the Consumer has a state and it's doesn't change with the rebuild bc it has no request concept by default as FutureBuilder.

              //todo: chat GPT help
              /// key: ValueKey(widget.sourcesList[selectedIndex].id),
              /// Using ValueKey to force Flutter to rebuild NewsWidget when source changes.
              /// Before MVVM, FutureBuilder triggered a new API request on every rebuild
              /// because it directly listened to a Future.
              /// After MVVM, data is stored as state inside the ViewModel,
              /// and Consumer only listens to that state.
              /// Rebuild alone does not trigger a new request,
              /// so ValueKey ensures a new ViewModel instance is created per source.

            ),
          ),
        ],
      ),
    );
  }
}