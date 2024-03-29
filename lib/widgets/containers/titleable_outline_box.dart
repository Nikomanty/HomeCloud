import 'package:flutter/material.dart';
import 'package:home_cloud/core/constants/app_colors.dart';
import 'package:home_cloud/core/constants/styles.dart';

class TitleableOutlineBox extends StatelessWidget {
  final String? title;
  final Widget content;

  const TitleableOutlineBox({
    super.key,
    this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.onPrimaryVariant),
            borderRadius: Styles.smallRoundedCorner,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: content,
          ),
        ),
        if (title != null)
          Positioned(
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(title ?? ""),
            ),
          ),
      ],
    );
  }
}
