import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position _position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = _position.latitude;
      longitude = _position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
