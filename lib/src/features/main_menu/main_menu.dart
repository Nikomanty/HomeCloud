import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/main_menu/main_menu_item.dart';
import 'package:home_cloud/src/features/main_menu/utils/main_menu_utils.dart';
import 'package:home_cloud/src/features/weather/view/weather_view.dart';

class HomeCloudMainMenu extends StatelessWidget {
  const HomeCloudMainMenu({super.key});

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
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(60.0),
                  child: WeatherView(),
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
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: MainMenuItem(
              index: MainMenuUtils.homeCloudViews.indexOf(menuItem),
            ),
          );
        }).toList(),
      );
}
