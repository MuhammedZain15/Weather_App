import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/screens/home_screen.dart';

import 'bloc/weather_bloc.dart';
import 'core/app_theme_manger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(),
        ),
      ],
      child: MaterialApp(
        theme: AppThemeManger.Theme,
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: HomeScreen(),
      ),
    );
  }
}
