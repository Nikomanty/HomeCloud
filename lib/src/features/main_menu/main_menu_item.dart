import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import 'utils/main_menu_utils.dart';


class MainMenuItem extends StatelessWidget {
  final int index;

  const MainMenuItem({Key? key, required this.index}) : super(key: key);

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

  _openMenuItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainMenuUtils.homeCloudViews[index],
      ),
    );
  }
}