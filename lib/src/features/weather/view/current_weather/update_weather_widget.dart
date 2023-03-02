import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/constants/app_colors.dart';
import 'package:home_cloud/src/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';

class UpdateWeatherWidget extends StatelessWidget {
  const UpdateWeatherWidget({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                WeatherStrings.lastUpdate,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.onPrimaryVariant),
              ),
              Text(DateFormatUtils.formattedDateddMMyyyyHHmm(DateTime.now()),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
