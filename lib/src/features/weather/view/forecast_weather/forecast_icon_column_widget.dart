import 'package:flutter/material.dart';

class ForecastIconColumnWidget extends StatelessWidget {
  const ForecastIconColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
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
    padding: const EdgeInsets.all(3.5),
    child: Icon(iconData, size: 20),
  );
}