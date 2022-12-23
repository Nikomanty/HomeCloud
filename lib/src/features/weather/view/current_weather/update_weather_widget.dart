import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';

class UpdateWeatherWidget extends StatelessWidget {
  const UpdateWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () => context.read<WeatherCubit>().updateData(),
              icon: const Icon(Icons.update)),
          Column(
            children: [
              Text(
                WeatherStrings.lastUpdate,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Text(DateFormatUtils.formattedDateddMMyyyyHHmm(DateTime.now())),
            ],
          ),
        ],
      ),
    );
  }
}
