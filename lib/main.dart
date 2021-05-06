import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/View/Screens/HomeView.dart';
import 'View/Screens/LoadingView.dart';
import 'View/Screens/SomethingIsWrongView.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  Future<void> _getWeatherData()async {
    print('GetWeatherData');
  }
  Future<bool> _getFutureBool() {
    return Future.delayed(Duration(milliseconds: 10))
        .then((onValue) => true);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/HomeView': (context) => HomeView(),
      },
      home: FutureBuilder(
        future: _getFutureBool(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SomethingWentWrong();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeView();
          }
          return Loading();
        },
      ),
    );
  }
}
