import 'package:example/examples/usecases/tagselector/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TagsSelectingPage extends StatelessWidget {
  const TagsSelectingPage({
    Key? key,
    required this.selectedTags,
    required this.onSelect,
  }) : super(key: key);

  final List<String> selectedTags;
  final Function(String tag) onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: selectedTags.isEmpty
          ? Center(
              child: Text(
              'Select tags',
              style: Theme.of(context).textTheme.headline5,
            ))
          : Wrap(
              spacing: 10,
              children: selectedTags
                  .map((e) => TagButton(onTap: () => onSelect(e), title: e))
                  .toList(),
            ),
    );
  }
}
