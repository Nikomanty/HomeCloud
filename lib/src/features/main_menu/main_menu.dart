import 'package:flutter/material.dart';

import 'utils/main_menu_utils.dart';
import 'main_menu_item.dart';


class HomeCloudMainMenu extends StatelessWidget {
  const HomeCloudMainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _menuItems(),
                ),
              ),
              //TODO: Add weather box
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItems() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: MainMenuUtils.homeCloudViews.map((menuItem) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: MainMenuItem(
            index: MainMenuUtils.homeCloudViews.indexOf(menuItem),
          ),
        ),
      );
    }).toList(),
  );
}