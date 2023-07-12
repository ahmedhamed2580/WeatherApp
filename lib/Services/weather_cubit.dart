import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:untitled16/models/WeatherModel.dart';


part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weather;
  String cityname='';
  Future<String> determineCityName()async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(PermissionFailure());
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(PermissionFailure());
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(PermissionFailure());
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    } else {
      emit(PermissionSuccess());

      return getCityName();
    }
  }

  Future<String> getCityName() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String cityName = placemark.locality ?? '';
        cityname=cityName;
        getdata(cityname);
        return cityName;
      }
    } catch (e) {
      print('Error: $e');
    }

    return ''; // Return an empty string if the city name couldn't be retrieved
  }
  Future<WeatherModel?> getdata(String cityname) async{
    try {
      emit(WeatherLoading());
      Uri url = Uri.parse(
              'https://api.weatherapi.com/v1/forecast.json?key=0ea337b817234e6a93d35847232006&q=$cityname&days=40');
      http.Response response =await http.get(url);
      Map<String,dynamic>data=jsonDecode(response.body);
      emit(WeatherSuccess());
      weather= WeatherModel.fromjson(data);

      return weather;
    } catch (e) {
      emit(WeatherFailure());

      throw Exception('Failed to fetch weather data'); // Throw an exception instead of returning null

    }


  }



}
