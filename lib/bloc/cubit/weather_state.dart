part of 'weather_cubit.dart';

@immutable
class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFetched extends WeatherState {
  final WeatherModel weatherData;

  WeatherFetched({required this.weatherData});
}

class WeatherFailure extends WeatherState {}
