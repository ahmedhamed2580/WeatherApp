import 'package:untitled16/generated/assets.dart';

class WeatherModel {
  DateTime date;
  String state;
  double avgtemp;
  double wind;
  int Humidity;
  int Chance_of_rain;
  String image;
  int airquality;
  double uv;
  double pressure;
  double precipitation;
  double visibility;
  List<dynamic> forecasthours;
  List<dynamic> forecastdays;

  WeatherModel({
    required this.state,
    required this.avgtemp,
    required this.Chance_of_rain,
    required this.wind,
    required this.Humidity,
    required this.date,
    required this.image,
    required this.airquality,
    required this.uv,
    required this.pressure,
    required this.precipitation,
    required this.visibility,
    required this.forecasthours,
    required this.forecastdays,
  });

  factory WeatherModel.fromjson(var data) {
    var forecast = data['forecast']['forecastday'][0]['day'];
    var current = data['current'];
    var forecasthours = data['forecast']['forecastday'][2]['hour'];
    var forecastdays = data['forecast']['forecastday'];

    return WeatherModel(
      state: forecast['condition']['text'],
      avgtemp: forecast['avgtemp_c'],
      Chance_of_rain: forecast['daily_chance_of_rain'],
      wind: current['wind_kph'],
      Humidity: current['humidity'],
      date: DateTime.parse(current['last_updated']),
      image: current['condition']['icon'],
      airquality: current['wind_degree'],
      uv: current['uv'],
      pressure: current['pressure_mb'],
      precipitation: current['precip_mm'],
      visibility: current['vis_km'],
      forecasthours: forecasthours,
      forecastdays: forecastdays,
    );
  }

  List<Map<dynamic, dynamic>> getForecastHoursData() {
    List<Map<dynamic, dynamic>> forecastHoursData = [];

    for (var hour in forecasthours) {
      var hourData = {
        'date': DateTime.parse(hour['time']),
        'avgtemp': hour['temp_c'],
        'state': hour['condition']['text'],
      };
      forecastHoursData.add(hourData);
    }
    return forecastHoursData;
  }

  List<Map<dynamic, dynamic>> getForecastDaysData() {
    List<Map<dynamic, dynamic>> forecastDaysData = [];

    for (var day in forecastdays) {
      var DaysData = {
        'date': DateTime.parse(day['date']),
        'avgtemp': day['day']['avgtemp_c'],
        'maxtemp': day['day']['maxtemp_c'],
        'mintemp': day['day']['mintemp_c'],
        'state': day['day']['condition']['text'],
      };
      forecastDaysData.add(DaysData);
    }
    return forecastDaysData;
  }

  @override
  String toString() {
    return super.toString();
  }

  String getimage([String? state]) {
    if (state == "Sunny" || state == "Clear") {
      return Assets.imagesCLEARSUNNY;
    } else if (state == "Cloudy" || state == "Partly Cloudy") {
      return Assets.imagesCloudy;
    } else if (state == "Fog" || state == "Freezing fog") {
      return Assets.imagesFog;
    } else if (state == "Light Rain" ||
        state == "Patchy rain nearby" ||
        state == "Patchy light drizzle" ||
        state == "Light drizzle" ||
        state == "Freezing drizzle") {
      return Assets.imagesLightRain;
    } else if (state == "Rain" ||
        state == "Moderate rain at times" ||
        state == "Moderate rain" ||
        state == "Heavy rain at times" ||
        state == "Heavy freezing drizzle") {
      return Assets.imagesRain;
    } else if (state == "Heavy Rain" ||
        state == "Heavy rain" ||
        state == "Torrential rain shower" ||
        state == "Thunderstorms" ||
        state == "Patchy freezing drizzle nearby" ||
        state == "Thundery outbreaks in nearby" ||
        state == "Moderate or heavy rain shower") {
      return Assets.imagesHeavyrain;
    } else if (state == "Light Snow" ||
        state == "Patchy snow nearby" ||
        state == "Patchy sleet nearby" ||
        state == "Patchy light snow" ||
        state == "Patchy moderate snow" ||
        state == "Snow" ||
        state == "Moderate snow" ||
        state == "Heavy Snow" ||
        state == "Patchy heavy snow" ||
        state == "Heavy snow" ||
        state == "Blizzard" ||
        state == "Thundery outbreaks in nearby") {
      return Assets.imagesSnow;
    } else if (state == "Hail" ||
        state == "Light sleet" ||
        state == "Moderate or heavy sleet" ||
        state == "Light sleet showers" ||
        state == "Moderate or heavy sleet showers" ||
        state == "Ice pellets") {
      return Assets.imagesHail;
    }
    return Assets.imagesCLEARSUNNY;
  }
}
