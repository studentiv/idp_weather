import 'package:dio/dio.dart';
import 'package:idp_weather/domain/repository.dart';
import 'package:idp_weather/domain/weather_entity.dart';
import 'package:idp_weather/key.dart';

import 'models/details_weather_model.dart';
import 'models/general_weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl();

  @override
  Future<GeneralWeatherEntity> getGeneralWeather(double lat, double lon) async {
    const baseUrl = 'http://api.weatherbit.io/v2.0';
    const daysNumber = 10;
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      final response = await dio.get('/forecast/daily', queryParameters: {
        'lat': lat,
        'lon': lon,
        'days': daysNumber,
        'key': generalApiKey,
      });
      if (response.statusCode == 200) {
        final data = response.data;
        final dto = GeneralWeatherModelDto.fromJson(data);
        return dto.fromDto();
      } else {
        throw Exception('Response failure');
      }
    } catch (error) {
      throw Exception('Request failure');
    }
  }

  @override
  Future<DetailsWeatherEntity> getDetailsWeather(String location) async {
    const baseUrl = 'https://api.weatherapi.com/v1';
    const daysNumber = 2;
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      final response = await dio.get('/forecast.json', queryParameters: {
        'key': detailsApiKey,
        'q': location,
        'days': daysNumber,
        'lang': langCode,
      });
      if (response.statusCode == 200) {
        final data = response.data;
        final weatherModelDto = DetailsWeatherModelDto.fromJson(data);
        return weatherModelDto.fromDto();
      } else {
        throw Exception('Response failure');
      }
    } catch (error) {
      throw Exception('Request failure');
    }
  }
}

extension WeatherModelDtoX on DetailsWeatherModelDto {
  DetailsWeatherEntity fromDto() => DetailsWeatherEntity(
        perDay: forecast.forecastItems.map((e) => e.fromDto()),
      );
}

extension ForecastItemDtoX on ForecastItemDto {
  WeatherPerDay fromDto() => WeatherPerDay(
        date: date,
        details: perHour.map((e) => e.fromDto()),
      );
}

extension WeatherPerHourDtoX on WeatherPerHourDto {
  WeatherPerHour fromDto() => WeatherPerHour(
        time: time,
        temp: temp,
        description: info.description,
      );
}

extension GeneralWeatherModelDtoX on GeneralWeatherModelDto {
  GeneralWeatherEntity fromDto() => GeneralWeatherEntity(
        city: city,
        data: data.map((e) => e.fromDto()),
      );
}

extension GeneralWeatherDataModelDtoX on GeneralWeatherDataModelDto {
  GeneralWeatherData fromDto() => GeneralWeatherData(
        temp: temp,
        info: info.fromDto(),
        date: date,
      );
}

extension GeneralWeatherInfoModelDtoX on GeneralWeatherInfoModelDto {
  GeneralWeatherInfo fromDto() => GeneralWeatherInfo(
        icon: icon,
        description: description,
      );
}
