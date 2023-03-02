import 'package:flutter/material.dart';

class ForecastIconColumn extends StatelessWidget {
  const ForecastIconColumn({super.key});

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

  Widget _forecastPrefixIcon(IconData iconData) => Padding(
    padding: const EdgeInsets.all(4.5),
    child: Icon(iconData, size: 19),
  );
}