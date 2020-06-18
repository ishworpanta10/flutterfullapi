import 'package:flutter/material.dart';
import 'package:json_api/class/location.dart';
import 'package:json_api/class/service.dart';
import 'package:json_api/screens/mainpage.dart';

final service = Services();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  final apiKey = '9ec9b8da993eb0a9abd195967abc5b58';

  @override
  void initState() {
    super.initState();
    apiData();
    getLocation();
    // service.getOverallData();
    // service.getWeatherData();
    // service.getCountryData();
  }

  void getLocation() async {
    LocationHelper location = LocationHelper();
    await location.getCurrentLocation();
    latitude = location.latitide;
    longitude = location.longitude;
  }

  Future<void> apiData() async {
    var nepaldata = await service.getNepalData();
    var overallData = await service.getOverallData();
    var countryData = await service.getCountryData();
    var weatherData = await service.getWeatherData(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(
          nepalData: nepaldata,
          wetherData: weatherData,
          overallData: overallData,
          countryData: countryData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
