import 'package:flutter/material.dart';
import 'package:json_api/constants/constants.dart';

class MainPage extends StatefulWidget {
  final nepalData;
  final wetherData;
  final countryData;
  final overallData;
  MainPage(
      {this.nepalData, this.wetherData, this.countryData, this.overallData});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //nepal api
  String countryName;
  String totalCases;
  String activeCases;
  String newCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String recorededDate;

  //weather api
  String locname;
  String weatherCondition;
  String detailDesc;
  String temp;

  //overall data
  String oTotalCases;
  String oNewCases;
  String oTotalDeaths;
  String oNewDeaths;
  String oTotalRecovered;
  String oActiveCases;
  String oSeriousCritical;
  String oStatTakeDate;

  //country api

  String cConName;
  String cTotalCases;
  String cTotalDeaths;
  String cTotalRecovered;
  String cNewDeaths;
  String cNewCases;
  String cSeriousCritical;
  String cActiveCases;
  String cTotalTests;
  String cStatDateTaken;

  @override
  void initState() {
    super.initState();
    // print(widget.nepalData);
    updateUINepal(widget.nepalData);
    updateUIWeather(widget.wetherData);
    updateUICountry(widget.countryData);
    updateUIOverall(widget.overallData);
  }

  //data from nepal
  void updateUINepal(dynamic apiData) async {
    countryName = apiData['latest_stat_by_country'][0]['country_name'];
    totalCases = apiData['latest_stat_by_country'][0]['total_cases'];
  }

  //weather data
  void updateUIWeather(dynamic apiData) async {
    locname = apiData['name'];
    weatherCondition = apiData['weather'][0]['main'];
    detailDesc = apiData['weather'][0]['description'];
    temp = apiData['main']['temp'].toString();
  }

  //data from world
  void updateUIOverall(dynamic apiData) async {
    oTotalCases = apiData['total_cases'];
  }

  //data from contrywise
  void updateUICountry(dynamic apiData) async {
    cConName = apiData['countries_stat'][0]['country_name'];
    cTotalCases = apiData['countries_stat'][0]['cases'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Api Data"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //nepal
              Text(
                "Nepal Data",
                style: kheadingStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Country name : $countryName"),
              Text("Total cases : $totalCases"),
              SizedBox(
                height: 40.0,
                width: 400.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),

              //overall
              Text(
                "Overall Data",
                style: kheadingStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Total Cases : $oTotalCases"),
              SizedBox(
                height: 40.0,
                width: 400.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),

              //Country Wise
              Text(
                "Country wise Data",
                style: kheadingStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Total Cases : $cTotalCases"),
              SizedBox(
                height: 40.0,
                width: 400.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),

              //weather data
              Text(
                "Today's weather Conditon",
                style: kheadingStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Location : $locname"),
              Text("Weather Conditon : $weatherCondition"),
              Text("Details Conditon : $detailDesc"),
              Text("Temperature : $temp °C")
            ],
          ),
        ),
      ),
    );
  }
}
