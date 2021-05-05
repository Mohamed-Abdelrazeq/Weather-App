import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/View/Screens/HomeView.dart';
import 'View/Screens/LoadingView.dart';
import 'View/Screens/SomethingIsWrongView.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          // ChangeNotifierProvider<CurrentPageContoller>(create: (_) => CurrentPageContoller()),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  Future<void> _getWeatherData()async {

    print('GetWeatherData');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/HomeView': (context) => HomeView(),
      },
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
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
