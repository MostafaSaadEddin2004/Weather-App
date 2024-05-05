import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final weatherPageColor = context.read<WeatherCubit>().weatherData;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: weatherPageColor == null
                  ? Colors.blue
                  : weatherPageColor.getColor(),
              title: const Text('Weather'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SearchPage();
                      }));
                    },
                    icon: const Icon(Icons.search)),
              ],
            ),
            body: Builder(builder: ((context) {
              if (state is WeatherLoading) {
                return const Loading();
              } else if (state is WeatherFetched) {
                final weatherData = context.read<WeatherCubit>().weatherData;
                return FetchedDataBody(weatherData: weatherData!);
              } else if (state is WeatherFailure) {
                return AlertDialog(
                  title: const Text('Warning'),
                  actions: [
                    Column(children: [
                       Text(state.errorMessage),
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
                      textAlign: TextAlign.center,
                      'There is no weather.',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                );
              }
            })));
      },
    );
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
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Spacer(
          flex: 1,
        ),
        Text(
          weatherData.locName,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Update date:  ${weatherData.date.substring(0, 10)}',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Update Time:  ${weatherData.date.substring(11, 16)}',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  weatherData.getIcon(),
                  fit: BoxFit.cover,
                )),
            Text(
              weatherData.temp.toInt().toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text(
                  'maxTemp : ${weatherData.maxTemp.toInt()}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'minTemp : ${weatherData.minTemp.toInt()}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          weatherData.conditionText,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const Spacer(
          flex: 8,
        )
      ]),
    );
  }
}
