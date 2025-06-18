import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WakeMeHereApp extends StatelessWidget {
  const WakeMeHereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Wake Me Here'), centerTitle: true),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Iconsax.search_normal, size: 30, color: Colors.black),
                ],
              ),
            ),
            Center(
              child: Container(
                child: const Text(
                  'Map will be displayed here',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
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
