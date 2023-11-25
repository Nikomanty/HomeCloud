import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/core/constants/app_colors.dart';
import 'package:home_cloud/core/utils/date_formatters.dart';
import 'package:home_cloud/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/features/weather/view/utils/weather_strings.dart';

class UpdateWeatherWidget extends StatelessWidget {
  const UpdateWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () => context.read<WeatherCubit>().updateData(),
              icon: const Icon(
                Icons.update,
              ),
              constraints: const BoxConstraints(),
              iconSize: 18,
              splashRadius: 18,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                WeatherStrings.lastUpdate,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.onPrimaryVariant),
              ),
              Text(DateFormatters.formattedDateHHmmddMMyyyy(DateTime.now()),
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
