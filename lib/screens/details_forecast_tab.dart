import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idp_weather/domain/weather_entity.dart';
import 'package:intl/intl.dart';

import 'home_page.dart';

class DetailsForecastTab extends ConsumerWidget {
  const DetailsForecastTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = MyProviders.of(context).providers;
    if (provider.detailsWeatherProvider != null) {
      final AsyncValue<DetailsWeatherEntity?> weather = ref.watch(
        provider.detailsWeatherProvider!,
      );

      return weather.when(
        data: (data) => data != null
            ? ListView(children: data.perDay.map(_DayItem.new).toList())
            : const Center(child: Text('Failed to get info')),
        error: (_, __) => const Center(
          child: Text('Failed to get weather info'),
        ),
        loading: () => const Center(
          child: SizedBox(
            height: 56,
            width: 56,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return const Center(child: Text('Failed to get info'));
    }
  }
}

class _DayItem extends StatelessWidget {
  final WeatherPerDay day;

  const _DayItem(this.day);

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      day.date * 1000,
      isUtc: true,
    ).toLocal();
    String formattedDate = DateFormat('dd-MM').format(dateTime);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Date: $formattedDate',
            style: const TextStyle(fontSize: 32),
          ),
        ),
        ...day.details.map(_HourItem.new).toList(),
      ],
    );
  }
}

class _HourItem extends StatelessWidget {
  final WeatherPerHour hour;

  const _HourItem(this.hour);

  @override
  Widget build(BuildContext context) {
    final time = DateTime.fromMillisecondsSinceEpoch(
      hour.time * 1000,
      isUtc: true,
    ).toLocal();
    final formattedTime = DateFormat('hh:mm').format(time);

    return ListTile(
      title: Text('Temp: ${hour.temp}'),
      subtitle: Text(hour.description),
      trailing: Text(formattedTime),
    );
  }
}
