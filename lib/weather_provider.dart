import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/user_provider.dart';
import 'package:weather/weather_repository.dart';

class WeatherProvider extends ChangeNotifier {
  final Ref ref;

  Position? _position;
  bool _isLoadder = false;

  WeatherProvider({required this.ref});

  bool get isLoadder => _isLoadder;
  Position? get position => _position;

  void setLoader(bool value) {
    _isLoadder = value;
    notifyListeners();
  }

  void checkIfuserIsPro() {
    if (ref.read(userNotifer).isAProUser) {
      // Pro user
    } else {
      // become a pro memeber
    }
  }

  Future getLocationofUser() async {
    setLoader(true);
    await Future.delayed(const Duration(seconds: 1));
    _position = await ref.read(weatherProvider).determinePosition();
    setLoader(false);
  }
}

final weatherChangeProvider =
    ChangeNotifierProvider((ref) => WeatherProvider(ref: ref));
