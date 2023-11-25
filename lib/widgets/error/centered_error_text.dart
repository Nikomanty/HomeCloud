import 'package:flutter/material.dart';
import 'package:home_cloud/core/constants/app_colors.dart';

class CenteredErrorText extends StatelessWidget {
  final String? errorMessage;

  const CenteredErrorText({
    super.key,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage ?? "No error message found.",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: AppColors.errorColor)),
    );
  }
}
