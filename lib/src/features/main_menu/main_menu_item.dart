import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/app_colors.dart';
import 'package:home_cloud/src/core/constants/styles.dart';
import 'package:home_cloud/src/features/main_menu/utils/main_menu_utils.dart';

class MainMenuItem extends StatelessWidget {
  final String viewName;
  final double aspectRatio;

  const MainMenuItem({
    super.key,
    required this.viewName,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => _openMenuItem(context),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: Styles.largeRoundedCorner,
            boxShadow: Styles.itemShadow,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Icon(
                MainMenuUtils.getItemIconByName(viewName),
                color: AppColors.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openMenuItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<Widget>(
        builder: (context) => MainMenuUtils.getViewByName(viewName),
      ),
    );
  }
}
