import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/WeatherModel.dart';
import 'MonthListViewItem.dart';

class ItemBuilderScrollMonth extends StatelessWidget {
  const ItemBuilderScrollMonth({
    super.key,
    required this.weatherModel,
    required this.ScrollController,
  });

  final WeatherModel weatherModel;
  final ItemScrollController ScrollController;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
      scrollDirection: Axis.vertical,
      itemScrollController: ScrollController,
      itemBuilder: (context, index) {
        DateTime date = weatherModel.getForecastDaysData()[index]['date'];
        String dayName = DateFormat.EEEE().format(date);

        return MonthListViewItem(
            maxtemp:
                '${weatherModel.getForecastDaysData()[index]['maxtemp'].toInt()}',
            mintemp:
                '${weatherModel.getForecastDaysData()[index]['mintemp'].toInt()}',
            day: dayName,
            image: weatherModel
                .getimage(weatherModel.getForecastDaysData()[index]['state']));
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: weatherModel.getForecastDaysData().length,
    );
  }
}
