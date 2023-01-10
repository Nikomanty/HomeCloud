import 'package:flutter/material.dart';

class ForecastIconColumnWidget extends StatelessWidget {
  const ForecastIconColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _forecastPrefixIcon(Icons.ac_unit_rounded),
          _forecastPrefixIcon(Icons.account_circle_rounded),
          _forecastPrefixIcon(Icons.water_drop),
          _forecastPrefixIcon(Icons.arrow_right_alt),
        ],
      ),
    );
  }

  _forecastPrefixIcon(IconData iconData) => Padding(
    padding: const EdgeInsets.all(3),
    child: Icon(iconData, size: 18),
  );
}