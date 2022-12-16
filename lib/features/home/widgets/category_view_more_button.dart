import 'package:flutter/material.dart';

class CategoryViewMoreButton extends StatelessWidget {
  final String text;
  const CategoryViewMoreButton({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 26),
        ),
        const SizedBox(width: 2),
        const Icon(Icons.navigate_next),
      ],
    );
  }
}
