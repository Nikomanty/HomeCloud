import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/app_colors.dart';

class AppBarActionButton extends StatelessWidget {
  final VoidCallback action;
  final String title;

  const AppBarActionButton({
    super.key,
    required this.action,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: action,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.onSecondary),
        ),
      ),
    );
  }
}
