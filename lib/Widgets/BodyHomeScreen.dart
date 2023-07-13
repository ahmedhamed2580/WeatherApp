import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled16/models/WeatherModel.dart';

import '../Constant.dart';
import '../Services/weather_cubit.dart';
import '../Views/SearchScreen.dart';
import '../generated/assets.dart';
import 'BottomDataWeather.dart';
import 'Custom_Progress_Indector.dart';
import 'Details_Weidget.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({Key? key}) : super(key: key);

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  void initState() {
    super.initState();
    // Call determineCityName() when the widget is initialized
    BlocProvider.of<WeatherCubit>(context).determineCityName();
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel = BlocProvider.of<WeatherCubit>(context).weather;
    DateTime weatherDate =
        BlocProvider.of<WeatherCubit>(context).weather?.date ?? DateTime.now();
    String dayName =
        DateFormat.EEEE().format(weatherDate); // Day name (e.g., Monday)
    String dayNumber =
        DateFormat.d().format(weatherDate); // Day number (1 to 31)
    String month =
        DateFormat.MMMM().format(weatherDate); // Month name (e.g., January)
    final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherSuccess) {
          setState(() {
            weatherModel = weatherCubit.weather;
          });
        }
        if (state is PermissionFailure) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return SearchScreen();
            }),
          );
        }
      },
      child: weatherModel == null
          ? CustomProgressIndicator()
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 32, right: 32),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.search,
                                    color: Colors.white,
                                    size: WidthVerySmallImage),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return SearchScreen();
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                          Text(
                            weatherCubit.cityname,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$dayName, $dayNumber $month',
                            style: const TextStyle(
                              color: Colors.white30,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            weatherModel.getimage(weatherModel.state),
                            width: screenWidth * 0.5,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              weatherModel.state,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Hubballi',
                              ),
                            ),
                          ),
                          Text(
                            '${weatherModel.avgtemp.toInt()}\u00B0',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 75,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Hubballi',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DetailsWidget(
                                  name: 'Wind',
                                  image: Assets.imagesFog,
                                  number: '${weatherModel.wind.toInt()} km/h',
                                ),
                                SizedBox(
                                  height: 120,
                                  child: VerticalDivider(
                                    color: Colors.grey.withOpacity(0.4),
                                    thickness: 2,
                                  ),
                                ),
                                DetailsWidget(
                                  name: 'Humidity',
                                  image: Assets.imagesHumidity,
                                  number: '${weatherModel.Humidity}%',
                                ),
                                SizedBox(
                                  height: 120,
                                  child: VerticalDivider(
                                    color: Colors.grey.withOpacity(0.4),
                                    thickness: 2,
                                  ),
                                ),
                                DetailsWidget(
                                  name: 'Chance of rain',
                                  image: Assets.imagesRain,
                                  number: '${weatherModel.Chance_of_rain}%',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BottomDataWeather(
                            condation_name: 'Air quality',
                            condation_number: '${weatherModel.airquality}',
                          ),
                          BottomDataWeather(
                            condation_name: 'UV',
                            condation_number: '${weatherModel.uv}',
                          ),
                          BottomDataWeather(
                            condation_name: 'Wind',
                            condation_number: '${weatherModel.wind}',
                          ),
                        ],
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BottomDataWeather(
                              condation_name: 'Pressure',
                              condation_number: '${weatherModel.pressure}',
                            ),
                            BottomDataWeather(
                              condation_name: 'Precipitation',
                              condation_number: '${weatherModel.precipitation}',
                            ),
                            BottomDataWeather(
                              condation_name: 'Visibility',
                              condation_number: '${weatherModel.visibility}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
