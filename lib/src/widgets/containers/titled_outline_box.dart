import 'package:flutter/material.dart';

class TitledOutlineBox extends StatelessWidget {
  final String title;
  final Widget content;

  const TitledOutlineBox({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: content,
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(title),
          ),
        ),
      ],
    );
  }
}
