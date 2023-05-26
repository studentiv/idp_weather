// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsWeatherModelDto _$DetailsWeatherModelDtoFromJson(
        Map<String, dynamic> json) =>
    DetailsWeatherModelDto(
      forecast: ForecastDto.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsWeatherModelDtoToJson(
        DetailsWeatherModelDto instance) =>
    <String, dynamic>{
      'forecast': instance.forecast,
    };

ForecastDto _$ForecastDtoFromJson(Map<String, dynamic> json) => ForecastDto(
      forecastItems: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastItemDto.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$ForecastDtoToJson(ForecastDto instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastItems.toList(),
    };

ForecastItemDto _$ForecastItemDtoFromJson(Map<String, dynamic> json) =>
    ForecastItemDto(
      date: json['date_epoch'] as int,
      perHour: (json['hour'] as List<dynamic>)
          .map((e) => WeatherPerHourDto.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$ForecastItemDtoToJson(ForecastItemDto instance) =>
    <String, dynamic>{
      'date_epoch': instance.date,
      'hour': instance.perHour.toList(),
    };

WeatherPerHourDto _$WeatherPerHourDtoFromJson(Map<String, dynamic> json) =>
    WeatherPerHourDto(
      time: json['time_epoch'] as int,
      temp: (json['temp_c'] as num).toDouble(),
      info: WeatherPerHourInfoDto.fromJson(
          json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherPerHourDtoToJson(WeatherPerHourDto instance) =>
    <String, dynamic>{
      'time_epoch': instance.time,
      'temp_c': instance.temp,
      'condition': instance.info,
    };

WeatherPerHourInfoDto _$WeatherPerHourInfoDtoFromJson(
        Map<String, dynamic> json) =>
    WeatherPerHourInfoDto(
      description: json['text'] as String,
    );

Map<String, dynamic> _$WeatherPerHourInfoDtoToJson(
        WeatherPerHourInfoDto instance) =>
    <String, dynamic>{
      'text': instance.description,
    };
