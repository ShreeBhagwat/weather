import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/constant.dart';
import 'package:weather/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    _determinePosition().then((value)async {
      await getWeatherByHttp(value).then((value) {
        log(value!);
      });
    }).catchError((e) {
      log('Error: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ElevatedButton(
      onPressed: () {},
      child: const Center(
        child: Text('Weather Screen'),
      ),
    ));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = false;
    LocationPermission permission;

    await Geolocator.isLocationServiceEnabled().then((value) {
      serviceEnabled = value;
    });
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

    final Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  Future<String> getWeatherByHttp(Position position) async {
    String API_URL =
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$API_KEY';

    Uri uri = Uri.parse(API_URL);
    await http.get(uri).then((value) {
      final response = jsonDecode(value.body);
      final weather = WeatherData.fromJson(response);

      return value.body.toString();
      ;
    }).catchError((e) {
      log(e.toString());
    });
  }

  void getWeatherByDio(Position position) async {
    final param = {
      'lat': position.latitude,
      'lon': position.longitude,
      'appid': API_KEY
    };

    bool isSame = false;
    final dio = Dio();
    dio
        .get('https://api.openweathermap.org/data/2.5/weather',
            queryParameters: param)
        .then((value) {
      log('DIO DATA');
      log(value.toString());
    });
  }
}
