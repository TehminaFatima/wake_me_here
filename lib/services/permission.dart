import 'package:geolocator/geolocator.dart';

Future<void> requestLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions are permanently denied');
  }
}

Stream<Position> getPositionStream() {
  return Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // update every 10 meters
    ),
  );
}
