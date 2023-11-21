import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final weatherProvider = Provider((ref) => WeatherRepository());


class WeatherRepository {

  Future<Position> determinePosition() async {
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
}
