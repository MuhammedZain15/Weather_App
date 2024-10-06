import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/weather_search.dart';
import 'package:weather_app/screens/widgets/back_ground_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 0.6 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              BackGroundWidget(),
              FutureBuilder(
                future: _determinePosition(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BlocProvider<WeatherBloc>(
                        create: (context) => WeatherBloc()
                          ..add(
                            FetchWeather(position: snapshot.data as Position),
                          ),
                        child: BlocBuilder<WeatherBloc, WeatherState>(
                          builder: (context, state) {
                            if (state is WeatherSuccess) {
                              return SizedBox(
                                width: size.width,
                                height: size.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "📍${state.weather.areaName}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          WeatherSearch()));
                                            },
                                            icon: Icon(
                                              Icons.search,
                                              size: 25,
                                              color: Colors.black,
                                            ))
                                      ],
                                    ),
                                    Text(
                                      "Good Morning",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      getWeatherImage(
                                          state.weather.weatherConditionCode!),
                                    ),
                                    Center(
                                      child: Text(
                                        "${state.weather.temperature!.celsius!.round()}°C",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 55,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        state.weather.weatherMain!
                                            .toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        DateFormat('EEE dd - ')
                                            .add_jm()
                                            .format(state.weather.date!),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/11.png",
                                              scale: 8,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sunrise",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  DateFormat().add_jm().format(
                                                      state.weather.sunrise!),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/12.png",
                                              scale: 8,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sunset",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  DateFormat().add_jm().format(
                                                      state.weather.sunset!),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/13.png",
                                              scale: 8,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Temp Max",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  "${state.weather.tempMax!.celsius!.round()}°C",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/14.png",
                                              scale: 8,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Temp Min",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  "${state.weather.tempMin!.celsius!.round()}°C",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

String getWeatherImage(int conditionCode) {
  if (conditionCode >= 200 && conditionCode < 300) {
    return 'assets/images/1.png'; // Thunderstorm
  } else if (conditionCode >= 300 && conditionCode < 400) {
    return 'assets/images/2.png'; // Drizzle
  } else if (conditionCode >= 500 && conditionCode < 600) {
    return 'assets/images/3.png'; // Rain
  } else if (conditionCode >= 600 && conditionCode < 700) {
    return 'assets/images/4.png'; // Snow
  } else if (conditionCode >= 700 && conditionCode < 800) {
    return 'assets/images/Atmosphere.png'; // Atmosphere (fog, mist, etc.)
  } else if (conditionCode == 800) {
    return 'assets/images/6.png'; // Clear Sky
  } else if (conditionCode > 800 && conditionCode < 900) {
    return 'assets/images/8.png'; // Clouds
  } else {
    return 'assets/images/9.png'; // Default or unknown weather condition
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
