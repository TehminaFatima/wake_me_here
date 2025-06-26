import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'map/map.dart';
import 'search_bar_widget.dart'; // your LocationSearchBar widget

class WakeMeHereApp extends StatefulWidget {
  const WakeMeHereApp({super.key});

  @override
  State<WakeMeHereApp> createState() => _WakeMeHereAppState();
}

class _WakeMeHereAppState extends State<WakeMeHereApp> {
  final TextEditingController controller = TextEditingController();
  Prediction? selectedPlace;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onPlaceSelected(Prediction prediction) {
    setState(() {
      selectedPlace = prediction;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                latitude: double.tryParse(selectedPlace?.lat ?? ''),
                longitude: double.tryParse(selectedPlace?.lng ?? ''),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedPlace != null) {
                  // TODO: Implement location monitoring/alarm here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Started monitoring location: ${selectedPlace!.description}',
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
