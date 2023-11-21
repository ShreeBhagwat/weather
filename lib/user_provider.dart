import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather_provider.dart';

class UserProvider extends ChangeNotifier {
  final Ref ref;

  bool _isAProUser = true;


  bool get isAProUser => _isAProUser;
  UserProvider({required this.ref});

  getPosition() {
    ref.read(weatherChangeProvider).position;
  }
}

final userNotifer = ChangeNotifierProvider((ref) => UserProvider(ref: ref));
