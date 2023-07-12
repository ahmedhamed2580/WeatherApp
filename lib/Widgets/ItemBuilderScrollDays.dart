import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/WeatherModel.dart';
import 'WeakeListViewItem.dart';

class ItemBuilderScrollDays extends StatelessWidget {
  const ItemBuilderScrollDays({
    super.key,
    required this.weatherModel,
    required this.ScrollController,
  });

  final WeatherModel weatherModel;
  final ItemScrollController ScrollController;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
        scrollDirection: Axis.horizontal,
        itemScrollController: ScrollController,
        itemBuilder: (context, index) {
         DateTime date= weatherModel.getForecastDaysData()[index]['date'];
         String dayName = DateFormat.EEEE().format(date).substring(0, 3).toUpperCase();
         String monthName= DateFormat.MMMM().format(date);
         String monthNumber= DateFormat.d().format(date);
          DateTime now = DateTime.now();
          int currentDay = int.parse(DateFormat('d').format(now));
          DateTime forecastDay = weatherModel.getForecastDaysData()[index]['date'];
          bool isSelected = currentDay == forecastDay;

          return WeakListViewItem(

              isSelected:isSelected,
              day: dayName,
              month: '$monthName,$monthNumber' ,
              degree: '${weatherModel.getForecastDaysData()[index]['avgtemp'].toInt()}',
              image: weatherModel.getimage(weatherModel.getForecastDaysData()[index]['state'])
          );

        },
        separatorBuilder: (context, index) => SizedBox(width: 20,),
        itemCount:weatherModel.getForecastDaysData().length,
    );
  }
}
