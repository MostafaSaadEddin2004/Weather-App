import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Models/WeatherModel.dart';
import 'package:weather/bloc/cubit/weather_cubit.dart';
import 'package:weather/components/Loading.dart';
import 'package:weather/screens/SearchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchPage();
                  }));
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: ((context, state) {
          if (state is WeatherLoading) {
            return const Loading();
          } else if (state is WeatherFetched) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherData;
            return FetchedDataBody(weatherData: weatherData!);
          } else if (state is WeatherFailure) {
            return AlertDialog(
              title: const Text('Warning'),
              actions: [
                Column(children: [
                  const Text('Something went wrong, please try again.'),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ));
                      },
                      child: const Text('Try again'))
                ]),
              ],
            );
          } else {
            return Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  'There is no weather, search a country weather.',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          }
        })));
  }
}

class FetchedDataBody extends StatelessWidget {
  const FetchedDataBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherData.getColor(),
        weatherData.getColor()[300]!,
        weatherData.getColor()[100]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Spacer(
          flex: 3,
        ),
        Text(
          '${weatherData.locName}',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          'Updated at:  ${weatherData.date}',
          style: TextStyle(fontSize: 24),
        ),
        Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 100,
                width: 100,
                child: Image.asset(
                  weatherData.getIcon(),
                  fit: BoxFit.cover,
                )),
            Text(
              '${weatherData.temp.toInt().toString()}',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text(
                  'maxTemp : ${weatherData.maxTemp.toInt()}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'minTemp : ${weatherData.minTemp.toInt()}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
        Text(
          '${weatherData.conditionText}',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Spacer(
          flex: 8,
        )
      ]),
    );
  }
}
