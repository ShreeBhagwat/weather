import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/constant.dart';
import 'package:weather/weather.dart';
import 'package:weather/weather_provider.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      ref.read(weatherChangeProvider).getLocationofUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherNotifier = ref.watch(weatherChangeProvider);
    return Scaffold(
        body: ElevatedButton(
      onPressed: () {},
      child: Center(
        child: weatherNotifier.isLoadder
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(weatherNotifier.position.toString()),
      ),
    ));
  }

  // Future<String> getWeatherByHttp(Position position) async {
  //   String API_URL =
  //       'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$API_KEY';

  //   Uri uri = Uri.parse(API_URL);
  //   await http.get(uri).then((value) {
  //     final response = jsonDecode(value.body);
  //     final weather = WeatherData.fromJson(response);

  //     return value.body.toString();
  //     ;
  //   }).catchError((e) {
  //     log(e.toString());
  //   });
  // }

  // void getWeatherByDio(Position position) async {
  //   final param = {
  //     'lat': position.latitude,
  //     'lon': position.longitude,
  //     'appid': API_KEY
  //   };

  //   bool isSame = false;
  //   final dio = Dio();
  //   dio
  //       .get('https://api.openweathermap.org/data/2.5/weather',
  //           queryParameters: param)
  //       .then((value) {
  //     log('DIO DATA');
  //     log(value.toString());
  //   });
  // }
}
