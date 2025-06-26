import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'map/map.dart';
import 'widgets/search_bar_widget.dart';
import 'services/permission.dart';

class WakeMeHereApp extends StatefulWidget {
  const WakeMeHereApp({super.key});

  @override
  State<WakeMeHereApp> createState() => _WakeMeHereAppState();
}

class _WakeMeHereAppState extends State<WakeMeHereApp> {
  final TextEditingController controller = TextEditingController();
  Prediction? selectedPlace;
  Position? currentPosition;
  StreamSubscription<Position>? positionStream;

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    try {
      await requestLocationPermission();
      positionStream = getPositionStream().listen((Position position) {
        setState(() {
          currentPosition = position;
        });
        print(
          'Current location: \${position.latitude}, \${position.longitude}',
        );
      });
    } catch (e) {
      print('Location error: \$e');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    positionStream?.cancel();
    super.dispose();
  }

  void _onPlaceSelected(Prediction prediction) {
    setState(() {
      selectedPlace = prediction;
    });
  }

  @override
  Widget build(BuildContext context) {
    double? destLat = double.tryParse(selectedPlace?.lat ?? '');
    double? destLng = double.tryParse(selectedPlace?.lng ?? '');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Wake Me Here'), centerTitle: true),
        body: Column(
          children: <Widget>[
            LocationSearchBar(
              controller: controller,
              onPlaceSelected: _onPlaceSelected,
            ),
            Expanded(
              child: MapWidget(
                latitude: destLat,
                longitude: destLng,
                currentLat: currentPosition?.latitude,
                currentLng: currentPosition?.longitude,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedPlace != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Started monitoring location: \${selectedPlace!.description}',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a location first'),
                    ),
                  );
                }
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
