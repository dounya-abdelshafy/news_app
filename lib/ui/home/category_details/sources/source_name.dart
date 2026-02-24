import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';

class SourceName extends StatelessWidget {
  Sources sources;
  bool isSelected;

  SourceName({super.key, required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      sources.name ?? '',
      style: isSelected
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}
