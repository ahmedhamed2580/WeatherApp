import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled16/models/WeatherModel.dart';

import '../Constant.dart';
import '../Services/weather_cubit.dart';
import 'ItemBuilderScrollDays.dart';
import 'ItemBuilderScrollHours.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'ItemBuilderScrollMonth.dart';

class BodyForcastScreen extends StatelessWidget {
  final ItemScrollController scrollControllerHour = ItemScrollController();
  final ItemScrollController scrollControllerDays = ItemScrollController();
  final ItemScrollController scrollControllermonth = ItemScrollController();

  BodyForcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<WeatherCubit>(context).weather!;
    scrollToCurrentState(DateTime.now().hour, scrollControllerHour);
    scrollToCurrentState(DateTime.now().day, scrollControllerDays);

    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Today',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: ItemBuilderScrollHours(
                  weatherModel: weatherModel,
                  ScrollController: scrollControllerHour,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                '7 days forecast',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 250,
                child: ItemBuilderScrollDays(
                  weatherModel: weatherModel,
                  ScrollController: scrollControllerDays,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                '40 days forecast',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 220,
                child: ItemBuilderScrollMonth(
                  weatherModel: weatherModel,
                  ScrollController: scrollControllermonth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
