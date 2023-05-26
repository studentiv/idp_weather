import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_weather_model.g.dart';

@JsonSerializable()
class GeneralWeatherModelDto {
  @JsonKey(name: 'city_name')
  final String city;

  @JsonKey(name: 'data')
  final Iterable<GeneralWeatherDataModelDto> data;

  GeneralWeatherModelDto({required this.city, required this.data});

  factory GeneralWeatherModelDto.fromJson(Map<String, dynamic> json) =>
      _$GeneralWeatherModelDtoFromJson(json);
}

@JsonSerializable()
class GeneralWeatherDataModelDto {
  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'datetime')
  final String date;

  @JsonKey(name: 'weather')
  final GeneralWeatherInfoModelDto info;

  GeneralWeatherDataModelDto({
    required this.date,
    required this.temp,
    required this.info,
  });

  factory GeneralWeatherDataModelDto.fromJson(Map<String, dynamic> json) =>
      _$GeneralWeatherDataModelDtoFromJson(json);
}

@JsonSerializable()
class GeneralWeatherInfoModelDto {
  @JsonKey(name: 'icon')
  final String icon;

  @JsonKey(name: 'description')
  final String description;

  GeneralWeatherInfoModelDto({required this.icon, required this.description});

  factory GeneralWeatherInfoModelDto.fromJson(Map<String, dynamic> json) =>
      _$GeneralWeatherInfoModelDtoFromJson(json);
}
