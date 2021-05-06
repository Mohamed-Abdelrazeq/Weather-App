import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/Constants.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height  = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          //AppBar
          Container(
            margin: EdgeInsets.only(top: _height*.02,left: _height*.03,right: _height*.03,bottom: _height*.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.menu_sharp,
                  color: secColor,
                  size: _width*.08,
                ),
                Column(
                  children: [
                    Text(
                      'May 5, 2020',
                      style: secStyle(_width),
                    ),
                    SizedBox(height: _height*.01,),
                    Text(
                      'Paris, FR',
                      style: mainStyle(_width),
                    )
                  ],
                )
              ],
            ),
          ),
          //DateChoices
          Container(
            margin: EdgeInsets.symmetric(horizontal: _height*.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: mainStyle(_width),
                ),
                Text(
                  'Tomorrow',
                  style: secStyle(_width),
                ),
                Text(
                  'After',
                  style: secStyle(_width),
                ),

              ],
            ),
          ),
          //TodayWeather
          Container(
            margin: EdgeInsets.only(top: _height*.05,bottom: _height*.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/PartlyCloudy.svg',
                  color: mainColor,
                  width: _width*.6,
                  height: _height*.22,
                ),
                SizedBox(height: _height*.03,),
                Text(
                  'PARTLY CLOUDY',
                  style: secStyle(_width*1.2),
                ),
                SizedBox(height: _height*.005,),
                Text(
                  ' 24°',
                  style: tempStyle(_width*2)
                )

              ],
            ),
          ),
          //TodayWeatherDetails
          Container(
            margin: EdgeInsets.symmetric(horizontal: _width*.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Wind : 13 km/h',
                      style: secStyle(_width),
                    ),
                    SizedBox(
                      height: _height*.02,
                    ),
                    Text(
                      'Humidity : 48%',
                      style: secStyle(_width),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Feeling : 25°',
                      style: secStyle(_width),
                    ),
                    SizedBox(
                      height: _height*.02,
                    ),
                    Text(
                      'UV : 2',
                      style: secStyle(_width),
                    ),
                  ],
                )
              ],
            ),
          ),
          //TodayWeatherAllDayLong
          Container(
            height: _height*.285,
            width: _width,
            padding: EdgeInsets.only(top: _height*.04,bottom: _height*.02),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: _width*.06,),
                TimeWeatherCard(width: _width, height: _height,temp: ' 24°',text: 'Cloudy',time: '17:00',imagePath: 'images/Cloudy.svg',),
                TimeWeatherCard(width: _width, height: _height,temp: ' 20°',text: 'Partly Cloudy',time: '21:00',imagePath: 'images/PartlyCloudy.svg',),
                TimeWeatherCard(width: _width, height: _height,temp: ' 19°',text: 'Sunny',time: '20:00',imagePath: 'images/Sunny.svg',),
                TimeWeatherCard(width: _width, height: _height,temp: ' 22°',text: 'Heavy Rain',time: '18:00',imagePath: 'images/HeavilyRainy.svg',),
                TimeWeatherCard(width: _width, height: _height,temp: ' 21°',text: 'Rainy',time: '19:00',imagePath: 'images/Rainy.svg',),
                SizedBox(width: _width*.06,),
              ],
            ),
          ),
          SizedBox(height: _height*.02,)
        ],
      ),
    );
  }
}

class TimeWeatherCard extends StatelessWidget {
  const TimeWeatherCard({
    @required double width,
    @required double height,
    @required this.imagePath,
    @required this.temp,
    @required this.text,
    @required this.time,
  }) : _width = width, _height = height;

  final double _width;
  final double _height;
  final String imagePath;
  final String temp;
  final String time;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width*.33,
      margin: EdgeInsets.only(right: _width*.05),
      decoration: BoxDecoration(
        color: secColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            color: mainColor,
            width: _width*.25,
            height: _height*.08,
          ),
          SizedBox(height: _height*.024,),
          Column(
            children: [
              Text(
                time,
                style: secStyle(_width),
              ),
              Text(
                  temp,
                  style: tempStyle(_width)
              ),

            ],
          ),
        ],
      ),
    );
  }
}
