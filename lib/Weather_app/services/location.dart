import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      Position position =
          // ignore: deprecated_member_use
          Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.low)
              as Position;

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
