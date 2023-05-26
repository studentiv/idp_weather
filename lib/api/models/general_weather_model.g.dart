// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralWeatherModelDto _$GeneralWeatherModelDtoFromJson(
        Map<String, dynamic> json) =>
    GeneralWeatherModelDto(
      city: json['city_name'] as String,
      data: (json['data'] as List<dynamic>).map((e) =>
          GeneralWeatherDataModelDto.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$GeneralWeatherModelDtoToJson(
        GeneralWeatherModelDto instance) =>
    <String, dynamic>{
      'city_name': instance.city,
      'data': instance.data.toList(),
    };

GeneralWeatherDataModelDto _$GeneralWeatherDataModelDtoFromJson(
        Map<String, dynamic> json) =>
    GeneralWeatherDataModelDto(
      date: json['datetime'] as String,
      temp: (json['temp'] as num).toDouble(),
      info: GeneralWeatherInfoModelDto.fromJson(
          json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralWeatherDataModelDtoToJson(
        GeneralWeatherDataModelDto instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'datetime': instance.date,
      'weather': instance.info,
    };

GeneralWeatherInfoModelDto _$GeneralWeatherInfoModelDtoFromJson(
        Map<String, dynamic> json) =>
    GeneralWeatherInfoModelDto(
      icon: json['icon'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$GeneralWeatherInfoModelDtoToJson(
        GeneralWeatherInfoModelDto instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'description': instance.description,
    };
