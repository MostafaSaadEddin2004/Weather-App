import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/Models/WeatherModel.dart';

class WeatherService {
  String apiUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '62617e7a9ca34169893215427231404';

  Future<WeatherModel> getWeather({required String cityName}) async {
    final response = await http.get(Uri.parse(
        '$apiUrl/forecast.json?key=$apiKey&q=$cityName&aqi=no&alerts=no'));
    print(response.body);
    print(response.statusCode);
    return WeatherModel.fromJson(jsonDecode(response.body));
  }
}
