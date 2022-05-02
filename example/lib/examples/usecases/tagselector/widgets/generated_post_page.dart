import 'package:flutter/material.dart';

class GeneratedPostPage extends StatelessWidget {
  const GeneratedPostPage({
    Key? key,
    required this.selectedTags,
  }) : super(key: key);

  final List<String> selectedTags;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        children: [
          Column(
            children: [
              const Text(
                  'Britain is famous all over the world for its gardens, dogs, villages, buses, cars, private schools, the Queen, sports like football and cricket, Parliament. However, not so much has been written about the wonderful food that can be found in Britain. Read two texts about food and say what the English eat and what the British food is like. Is there any difference between the English and the British food? The texts are for beginners and for the upper-intermediate level.'),
              const SizedBox(height: 10),
              Text(selectedTags.join(' ')),
            ],
          ),
        ],
      ),
    );
  }
}
