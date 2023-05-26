import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idp_weather/domain/weather_entity.dart';

import 'home_page.dart';

class ForecastTab extends ConsumerWidget {
  const ForecastTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = MyProviders.of(context).providers;
    if (provider.forecastProvider != null) {
      final AsyncValue<GeneralWeatherEntity?> weather = ref.watch(
        provider.forecastProvider!,
      );

      return weather.when(
        data: (data) => data != null
            ? ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Your location: ${data.city}',
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  ...data.data.map(_TilePreDay.new),
                ],
              )
            : const Center(child: Text('Failed to get info')),
        error: (_, __) => const Center(
          child: Text('Failed to get weather info'),
        ),
        loading: () => const _Loading(),
      );
    } else {
      return const Center(child: Text('Failed to get info'));
    }
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) => const Center(
        child: SizedBox(
          height: 56,
          width: 56,
          child: CircularProgressIndicator(),
        ),
      );
}

class _TilePreDay extends StatelessWidget {
  final GeneralWeatherData perDay;
  late final imageUrl =
      'https://www.weatherbit.io/static/img/icons/${perDay.info.icon}.png';

  _TilePreDay(this.perDay);

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Image.network(imageUrl),
        title: Text(perDay.info.description),
        subtitle: Text('Temp: ${perDay.temp} °C'),
        trailing: Text(perDay.date),
      );
}
