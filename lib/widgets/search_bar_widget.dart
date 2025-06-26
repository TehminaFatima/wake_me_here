import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:iconsax/iconsax.dart';
import '../services/location_search_service.dart'; // Import the new service file

class LocationSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Function(Prediction) onPlaceSelected;

  const LocationSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTap,
    required this.onPlaceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Iconsax.search_normal, color: Colors.black, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: locationSearchTextField(
              controller: controller,
              onPlaceSelected: onPlaceSelected,
            ),
          ),
        ],
      ),
    );
  }
}
