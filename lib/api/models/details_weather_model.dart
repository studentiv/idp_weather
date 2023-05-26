import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_weather_model.g.dart';

@JsonSerializable()
class DetailsWeatherModelDto {
  final ForecastDto forecast;

  DetailsWeatherModelDto({required this.forecast});

  factory DetailsWeatherModelDto.fromJson(Map<String, dynamic> json) =>
      _$DetailsWeatherModelDtoFromJson(json);
}

@JsonSerializable()
class ForecastDto {
  @JsonKey(name: 'forecastday')
  final Iterable<ForecastItemDto> forecastItems;

  ForecastDto({required this.forecastItems});

  factory ForecastDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDtoFromJson(json);
}

@JsonSerializable()
class ForecastItemDto {
  @JsonKey(name: 'date_epoch')
  final int date;

  @JsonKey(name: 'hour')
  final Iterable<WeatherPerHourDto> perHour;

  ForecastItemDto({required this.date, required this.perHour});

  factory ForecastItemDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemDtoFromJson(json);
}

@JsonSerializable()
class WeatherPerHourDto {
  @JsonKey(name: 'time_epoch')
  final int time;

  @JsonKey(name: 'temp_c')
  final double temp;

  @JsonKey(name: 'condition')
  final WeatherPerHourInfoDto info;

  WeatherPerHourDto({
    required this.time,
    required this.temp,
    required this.info,
  });

  factory WeatherPerHourDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherPerHourDtoFromJson(json);
}

@JsonSerializable()
class WeatherPerHourInfoDto {
  @JsonKey(name: 'text')
  final String description;

  WeatherPerHourInfoDto({required this.description});

  factory WeatherPerHourInfoDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherPerHourInfoDtoFromJson(json);
}
