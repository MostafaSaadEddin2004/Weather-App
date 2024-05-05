import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Services/WeatherServices.dart';
import 'package:weather/bloc/cubit/weather_cubit.dart';
import 'package:weather/screens/HomePage.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return WeatherCubit(weatherService: WeatherService());
      },
      child: Builder(builder: (context) {
        final weatherData = context.read<WeatherCubit>().weatherData;
        return MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: weatherData == null
                      ? Colors.blue
                      : weatherData.getColor(),
                  actionsIconTheme: const IconThemeData(color: Colors.white),
                  iconTheme: const IconThemeData(color: Colors.white),
                  titleTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 20)),
              ),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      }),
    );
  }
}
