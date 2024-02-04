import 'package:flutter/material.dart';

class WeatherModel {
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String conditionText;
  final String conditionIcon;
  final String locName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.conditionText,
      required this.conditionIcon,
      required this.locName});
  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        conditionText: data['current']['condition']['text'],
        conditionIcon: data['current']['condition']['icon'],
        locName: data['location']['name']);
  }

  String getIcon() {
    if (conditionText == 'Clear' || conditionText == 'Sunny') {
      return 'assets/icons/113.png';
    } else if (conditionText == 'Partly cloudy') {
      return 'assets/icons/116.png';
    } else if (conditionText == 'Cloudy') {
      return 'assets/icons/119.png';
    } else if (conditionText == 'Overcast') {
      return 'assets/icons/122.png';
    } else if (conditionText == 'Mist') {
      return 'assets/icons/143.png';
    } else if (conditionText == 'Patchy rain possible') {
      return 'assets/icons/176.png';
    } else if (conditionText == 'Patchy snow possible') {
      return 'assets/icons/179.png';
    } else if (conditionText == 'Patchy sleet possible') {
      return 'assets/icons/182.png';
    } else if (conditionText == 'Patchy freezing drizzle possible') {
      return 'assets/icons/185.png';
    } else if (conditionText == 'Thundery outbreaks possible') {
      return 'assets/icons/200.png';
    } else if (conditionText == 'Blowing snow') {
      return 'assets/icons/227.png';
    } else if (conditionText == 'Blizzard') {
      return 'assets/icons/230.png';
    } else if (conditionText == 'Fog') {
      return 'assets/icons/248.png';
    } else if (conditionText == 'Freezing fog') {
      return 'assets/icons/260.png';
    } else if (conditionText == 'Patchy light drizzle') {
      return 'assets/icons/263.png';
    } else if (conditionText == 'Light drizzle') {
      return 'assets/icons/266.png';
    } else if (conditionText == 'Freezing drizzle') {
      return 'assets/icons/281.png';
    } else if (conditionText == 'Heavy freezing drizzle') {
      return 'assets/icons/284.png';
    } else if (conditionText == 'Patchy light rain') {
      return 'assets/icons/293.png';
    } else if (conditionText == 'Light rain') {
      return 'assets/icons/296.png';
    } else if (conditionText == 'Moderate rain at times') {
      return 'assets/icons/299.png';
    } else if (conditionText == 'Moderate rain') {
      return 'assets/icons/302.png';
    } else if (conditionText == 'Heavy rain at times') {
      return 'assets/icons/305.png';
    } else if (conditionText == 'Heavy rain') {
      return 'assets/icons/308.png';
    } else if (conditionText == 'Light freezing rain') {
      return 'assets/icons/311.png';
    } else if (conditionText == 'Moderate or heavy freezing rain') {
      return 'assets/icons/314.png';
    } else if (conditionText == 'Light sleet') {
      return 'assets/icons/317.png';
    } else if (conditionText == 'Moderate or heavy sleet') {
      return 'assets/icons/320.png';
    } else if (conditionText == 'Patchy light snow') {
      return 'assets/icons/323.png';
    } else if (conditionText == 'Light snow') {
      return 'assets/icons/326.png';
    } else if (conditionText == 'Patchy moderate snow') {
      return 'assets/icons/329.png';
    } else if (conditionText == 'Moderate snow') {
      return 'assets/icons/332.png';
    } else if (conditionText == 'Patchy heavy snow') {
      return 'assets/icons/335.png';
    } else if (conditionText == 'Heavy snow') {
      return 'assets/icons/338.png';
    } else if (conditionText == 'Ice pellets') {
      return 'assets/icons/350.png';
    } else if (conditionText == 'Light rain shower') {
      return 'assets/icons/353.png';
    } else if (conditionText == 'Moderate or heavy rain shower') {
      return 'assets/icons/356.png';
    } else if (conditionText == 'Torrential rain shower') {
      return 'assets/icons/359.png';
    } else if (conditionText == 'Light sleet showers') {
      return 'assets/icons/362.png';
    } else if (conditionText == 'Moderate or heavy sleet showers') {
      return 'assets/icons/365.png';
    } else if (conditionText == 'Light snow showers') {
      return 'assets/icons/368.png';
    } else if (conditionText == 'Moderate or heavy snow showers') {
      return 'assets/icons/371.png';
    } else if (conditionText == 'Light showers of ice pellets') {
      return 'assets/icons/374.png';
    } else if (conditionText == 'Moderate or heavy showers of ice pellets') {
      return 'assets/icons/377.png';
    } else if (conditionText == 'Patchy light rain with thunder') {
      return 'assets/icons/386.png';
    } else if (conditionText == 'Moderate or heavy rain with thunder') {
      return 'assets/icons/389.png';
    } else if (conditionText == 'Patchy light snow with thunder') {
      return 'assets/icons/392.png';
    } else {
      return 'assets/icons/395.png';
    }
  }

  MaterialColor getColor() {
    if (conditionText == 'Clear' || conditionText == 'Sunny') {
      return Colors.amber;
    } else if (conditionText == 'Partly cloudy') {
      return Colors.grey;
    } else if (conditionText == 'Cloudy') {
      return Colors.grey;
    } else if (conditionText == 'Overcast') {
      return Colors.grey;
    } else if (conditionText == 'Mist') {
      return Colors.grey;
    } else if (conditionText == 'Patchy rain possible') {
      return Colors.blue;
    } else if (conditionText == 'Patchy snow possible') {
      return Colors.blueGrey;
    } else if (conditionText == 'Patchy sleet possible') {
      return Colors.blueGrey;
    } else if (conditionText == 'Patchy freezing drizzle possible') {
      return Colors.blue;
    } else if (conditionText == 'Thundery outbreaks possible') {
      return Colors.blueGrey;
    } else if (conditionText == 'Blowing snow') {
      return Colors.blueGrey;
    } else if (conditionText == 'Blizzard') {
      return Colors.blueGrey;
    } else if (conditionText == 'Fog') {
      return Colors.grey;
    } else if (conditionText == 'Freezing fog') {
      return Colors.blueGrey;
    } else if (conditionText == 'Patchy light drizzle') {
      return Colors.blue;
    } else if (conditionText == 'Light drizzle') {
      return Colors.blue;
    } else if (conditionText == 'Freezing drizzle') {
      return Colors.blue;
    } else if (conditionText == 'Heavy freezing drizzle') {
      return Colors.blue;
    } else if (conditionText == 'Patchy light rain') {
      return Colors.blue;
    } else if (conditionText == 'Light rain') {
      return Colors.blue;
    } else if (conditionText == 'Moderate rain at times') {
      return Colors.blue;
    } else if (conditionText == 'Moderate rain') {
      return Colors.blue;
    } else if (conditionText == 'Heavy rain at times') {
      return Colors.blue;
    } else if (conditionText == 'Heavy rain') {
      return Colors.blue;
    } else if (conditionText == 'Light freezing rain') {
      return Colors.blue;
    } else if (conditionText == 'Moderate or heavy freezing rain') {
      return Colors.blue;
    } else if (conditionText == 'Light sleet') {
      return Colors.blueGrey;
    } else if (conditionText == 'Moderate or heavy sleet') {
      return Colors.blueGrey;
    } else if (conditionText == 'Patchy light snow') {
      return Colors.blueGrey;
    } else if (conditionText == 'Light snow') {
      return Colors.blueGrey;
    } else if (conditionText == 'Patchy moderate snow') {
      return Colors.blueGrey;
    } else if (conditionText == 'Moderate snow') {
      return Colors.blueGrey;
    } else if (conditionText == 'Patchy heavy snow') {
      return Colors.blueGrey;
    } else if (conditionText == 'Heavy snow') {
      return Colors.blueGrey;
    } else if (conditionText == 'Ice pellets') {
      return Colors.blue;
    } else if (conditionText == 'Light rain shower') {
      return Colors.blue;
    } else if (conditionText == 'Moderate or heavy rain shower') {
      return Colors.blue;
    } else if (conditionText == 'Torrential rain shower') {
      return Colors.blue;
    } else if (conditionText == 'Light sleet showers') {
      return Colors.blueGrey;
    } else if (conditionText == 'Moderate or heavy sleet showers') {
      return Colors.blueGrey;
    } else if (conditionText == 'Light snow showers') {
      return Colors.blueGrey;
    } else if (conditionText == 'Moderate or heavy snow showers') {
      return Colors.blueGrey;
    } else if (conditionText == 'Light showers of ice pellets') {
      return Colors.blue;
    } else if (conditionText == 'Moderate or heavy showers of ice pellets') {
      return Colors.blue;
    } else if (conditionText == 'Patchy light rain with thunder') {
      return Colors.blue;
    } else if (conditionText == 'Moderate or heavy rain with thunder') {
      return Colors.blue;
    } else if (conditionText == 'Patchy light snow with thunder') {
      return Colors.blueGrey;
    } else {
      return Colors.blueGrey;
    }
  }
}
