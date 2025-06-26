import 'package:flutter/material.dart';
import 'package:wake_me_here/map/map.dart';
import 'package:wake_me_here/serach_bar_widget.dart';

class WakeMeHereApp extends StatelessWidget {
  WakeMeHereApp({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Wake Me Here'), centerTitle: true),
        body: Column(
          children: <Widget>[
            LocationSearchBar(controller: controller),
            Expanded(child: MapWidget()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
