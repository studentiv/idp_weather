import 'package:flutter/material.dart';
import 'package:idp_weather/providers.dart';

import 'details_forecast_tab.dart';
import 'forecast_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _tabs = [
    DetailsForecastTab(),
    ForecastTab(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final WeatherProviders providers = WeatherProviders();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: FutureBuilder(
        future: providers.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                height: 56,
                width: 56,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return MyProviders(
              providers: providers,
              child: IndexedStack(
                index: _currentIndex,
                children: _tabs,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Details'),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Forecast',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class MyProviders extends InheritedWidget {
  final WeatherProviders providers;

  const MyProviders({
    super.key,
    required this.providers,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(MyProviders oldWidget) =>
      providers != oldWidget.providers;

  static MyProviders of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyProviders>()!;
  }
}