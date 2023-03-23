import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/utils/utils.dart';
import 'package:home_cloud/src/features/main_menu/main_menu_item.dart';
import 'package:home_cloud/src/features/main_menu/utils/main_menu_utils.dart';
import 'package:home_cloud/src/features/weather/view/weather_view.dart';

class HomeCloudMainMenu extends StatelessWidget {
  const HomeCloudMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Widget mainMenuContent;
    if (Utils.isViewLandscape(context)) {
      mainMenuContent = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _menuItems(context, 1.5),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(60.0),
              child: WeatherView(),
            ),
          ),
        ],
      );
    } else {
      mainMenuContent = Column(
        children: [
          SizedBox(
              height: Utils.getViewHeight(context) * 0.3,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: WeatherView(),
              )),
          SizedBox(
            height: Utils.getViewHeight(context) * 0.7,
            width: double.infinity,
            child: _menuItems(context, 1),
          ),
        ],
      );
    }
    return Scaffold(body: SafeArea(child: Center(child: mainMenuContent)));
  }

  Widget _menuItems(BuildContext context, double aspectRatio) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: MainMenuUtils.homeCloudViews.map((viewName) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MainMenuItem(
                viewName: viewName,
                aspectRatio: aspectRatio,
              ),
            ),
          );
        }).toList(),
      );
}
