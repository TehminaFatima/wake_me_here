import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final double? latitude;
  final double? longitude;

  const MapWidget({Key? key, this.latitude, this.longitude}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;

  final LatLng _defaultPosition = const LatLng(24.8607, 67.0011);

  @override
  void didUpdateWidget(covariant MapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.latitude != null && widget.longitude != null) {
      mapController.animateCamera(
        CameraUpdate.newLatLng(LatLng(widget.latitude!, widget.longitude!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final position =
        (widget.latitude != null && widget.longitude != null)
            ? LatLng(widget.latitude!, widget.longitude!)
            : _defaultPosition;

    return GoogleMap(
      initialCameraPosition: CameraPosition(target: position, zoom: 14.0),
      onMapCreated: (controller) {
        mapController = controller;
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      markers:
          widget.latitude != null && widget.longitude != null
              ? {
                Marker(
                  markerId: const MarkerId('selected-location'),
                  position: LatLng(widget.latitude!, widget.longitude!),
                ),
              }
              : {},
    );
  }
}
