import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather_provider.dart';
import 'package:weather/weather_screen.dart';

class Trial extends ConsumerWidget {
  const Trial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(weatherChangeProvider);
    return Container();
  }
}

class TrialConsumer extends ConsumerStatefulWidget {
  const TrialConsumer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrialConsumerState();
}

class _TrialConsumerState extends ConsumerState<TrialConsumer> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Statetetet extends StatelessWidget {
  const Statetetet({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          navigate(context);
        },
        child: Text('asd'));
  }

  void navigate(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => WeatherScreen()));
  }
}

class kjshbdfkjsdhbf extends StatefulWidget {
  const kjshbdfkjsdhbf({super.key});

  @override
  State<kjshbdfkjsdhbf> createState() => _kjshbdfkjsdhbfState();
}

class _kjshbdfkjsdhbfState extends State<kjshbdfkjsdhbf> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (userIsLogggedIN) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => WeatherScreen()));
    } else {
      loginScreen();
    }
  }

  void navigate() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => WeatherScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
