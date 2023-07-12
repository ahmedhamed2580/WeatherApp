import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/WeatherModel.dart';
import 'TodayListViewItem.dart';

class ItemBuilderScrollHours extends StatelessWidget {
  const ItemBuilderScrollHours({
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

          DateTime now = DateTime.now();
          int currentHour = int.parse(DateFormat('H').format(now));
          DateTime forecastHour = weatherModel.getForecastHoursData()[index]['date'];

          bool isSelected = currentHour == forecastHour.hour;

          return TodayListViewItem(

              isSelected:isSelected,
             degree: '${weatherModel.getForecastHoursData()[index]['avgtemp'].toInt()}'
              ,hour:DateFormat('HH:mm').format(forecastHour),
              image: weatherModel.getimage(weatherModel.getForecastHoursData()[index]['state'])
          );

        },
        separatorBuilder: (context, index) => SizedBox(width: 20,),
        itemCount: 24);
  }
}
