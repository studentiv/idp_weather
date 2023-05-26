class DetailsWeatherEntity {
  final Iterable<WeatherPerDay> perDay;

  DetailsWeatherEntity({required this.perDay});
}

class WeatherPerDay {
  final int date;
  final Iterable<WeatherPerHour> details;

  WeatherPerDay({required this.date, required this.details});
}

class WeatherPerHour {
  final int time;
  final double temp;
  final String description;

  WeatherPerHour({
    required this.time,
    required this.temp,
    required this.description,
  });
}

class GeneralWeatherEntity {
  final String city;
  final Iterable<GeneralWeatherData> data;

  GeneralWeatherEntity({required this.city, required this.data});
}

class GeneralWeatherData {
  final double temp;
  final GeneralWeatherInfo info;
  final String date;

  GeneralWeatherData({
    required this.temp,
    required this.info,
    required this.date,
  });
}

class GeneralWeatherInfo {
  final String icon;
  final String description;

  GeneralWeatherInfo({required this.icon, required this.description});
}
