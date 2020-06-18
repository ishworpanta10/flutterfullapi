import 'package:geolocator/geolocator.dart';

class LocationHelper {
  double longitude;
  double latitide;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      longitude = position.longitude;
      latitide = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
