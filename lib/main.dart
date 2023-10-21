import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/HomePage.dart';
import 'package:weather/Services/WeatherServices.dart';
import 'package:weather/bloc/cubit/weather_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return WeatherCubit(weatherService: WeatherService());
    },
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            primary: BlocProvider.of<WeatherCubit>(context, listen: true)
                        .weatherData ==
                    null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context, listen: true)
                    .weatherData!
                    .getColor()),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
