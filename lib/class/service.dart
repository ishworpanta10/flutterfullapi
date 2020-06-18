import 'dart:convert';

import 'package:http/http.dart' as http;

const String url1 = 'https://brp.com.np/covid/nepal.php';
const String url2 = 'https://brp.com.np/covid/alldata.php';
const String url3 = 'https://brp.com.np/covid/country.php';

class Services {
  Future<dynamic> getNepalData() async {
    try {
      http.Response response = await http.get(url1);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        return data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getOverallData() async {
    try {
      http.Response response = await http.get(url2);
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getCountryData() async {
    try {
      http.Response response = await http.get(url3);
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getWeatherData(urltSring) async {
    try {
      http.Response response = await http.get(urltSring);
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }
}
