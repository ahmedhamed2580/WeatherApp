import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Services/weather_cubit.dart';
import 'package:flutter/services.dart';

import 'Views/SwabScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return WeatherCubit();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
          fontFamily: 'Maven Pro',
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const SwapeScreens(),
      ),
    );
  }
}
