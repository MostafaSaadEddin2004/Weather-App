import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/cubit/weather_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Search a city'), backgroundColor: Colors.blue),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
              onChanged: (value) {
                cityName = value;
              },
              onSubmitted: (data) {
                cityName = data;
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: cityName!);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  hintText: 'Search a city',
                  label: Text('Search'),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))))),
        ),
      ),
    );
  }
}
