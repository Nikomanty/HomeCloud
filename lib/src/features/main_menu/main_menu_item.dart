import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/main_menu/utils/main_menu_utils.dart';
import 'package:home_cloud/src/utils/styles.dart';

class MainMenuItem extends StatelessWidget {
  final int index;

  const MainMenuItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: InkWell(
        onTap: () => _openMenuItem(context),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(5),
            boxShadow: Styles.itemShadow(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Icon(
                MainMenuUtils.getItemIcon(
                  MainMenuUtils.homeCloudViews[index].toString(),
                ),
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
        builder: (context) => MainMenuUtils.homeCloudViews[index],
      ),
    );
  }
}