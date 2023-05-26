import 'weather_entity.dart';

abstract class WeatherRepository {
  Future<GeneralWeatherEntity> getGeneralWeather(double lat, double lon);

  Future<DetailsWeatherEntity> getDetailsWeather(String location);
}
