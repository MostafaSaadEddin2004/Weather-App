import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/Models/WeatherModel.dart';
import 'package:weather/Services/WeatherServices.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherService}) : super(WeatherState());
  WeatherService weatherService;
  WeatherModel? weatherData;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherData = await WeatherService().getWeather(cityName: cityName);
      emit(WeatherFetched(weatherData: weatherData!));
    } on Exception catch (e) {
      print(e);
      emit(WeatherFailure());
    }
  }
}
