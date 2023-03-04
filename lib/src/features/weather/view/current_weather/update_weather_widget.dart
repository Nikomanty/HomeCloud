import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/core/constants/app_colors.dart';
import 'package:home_cloud/src/core/utils/date_formatters.dart';
import 'package:home_cloud/src/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';

class UpdateWeatherWidget extends StatelessWidget {
  const UpdateWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.read<WeatherCubit>().updateData(),
            icon: const Icon(Icons.update),
            constraints: const BoxConstraints(),
          ),
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
              Text(DateFormatters.formattedDateHHmmddMMyyyy(DateTime.now()),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
