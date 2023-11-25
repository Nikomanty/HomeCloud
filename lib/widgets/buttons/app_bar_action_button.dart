import 'package:flutter/material.dart';
import 'package:home_cloud/core/constants/app_colors.dart';

class AppBarActionButton extends StatelessWidget {
  final String title;
  final VoidCallback action;

  const AppBarActionButton({
    super.key,
    required this.title,
    required this.action,
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
