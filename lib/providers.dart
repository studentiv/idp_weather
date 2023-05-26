import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

import 'api/repository.dart';
import 'domain/repository.dart';
import 'domain/weather_entity.dart';

class WeatherProviders {
  final WeatherRepository _repository;
  FutureProvider<GeneralWeatherEntity?>? _forecastProvider;
  FutureProvider<DetailsWeatherEntity?>? _detailsWeatherProvider;
  LocationData? _location;

  WeatherProviders() : _repository = WeatherRepositoryImpl() {
    init();
  }

  FutureProvider<GeneralWeatherEntity?>? get forecastProvider =>
      _forecastProvider;

  FutureProvider<DetailsWeatherEntity?>? get detailsWeatherProvider =>
      _detailsWeatherProvider;

  Future<void> init() async {
    await _initLocation();
    await _getForecastProvider();
    await _getDetailsWeatherProvider();
  }

  Future<void> _initLocation() async {
    final location = Location();
    _location = await location.getLocation();
  }

  Future<void> _getForecastProvider() async {
    final location = _location;
    if (location != null) {
      _forecastProvider = FutureProvider<GeneralWeatherEntity?>((ref) {
        if (location.latitude != null && location.longitude != null) {
          return _repository
              .getGeneralWeather(
                location.latitude!,
                location.longitude!,
              )
              .then((value) => value);
        }
        return null;
      });
    }
  }

  Future<void> _getDetailsWeatherProvider() async {
    final location = _location;
    if (location != null) {
      _detailsWeatherProvider = FutureProvider<DetailsWeatherEntity?>((ref) {
        if (location.latitude != null && location.longitude != null) {
          return _repository
              .getDetailsWeather('${location.latitude!} ${location.longitude!}')
              .then((value) => value);
        }
        return null;
      });
    }
  }
}
