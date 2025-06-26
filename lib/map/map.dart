import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final double? latitude; // selected destination lat
  final double? longitude; // selected destination lng
  final double? currentLat; // user's current lat
  final double? currentLng; // user's current lng

  const MapWidget({
    super.key,
    this.latitude,
    this.longitude,
    this.currentLat,
    this.currentLng,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final LatLng defaultPosition = const LatLng(24.8607, 67.0011);

    final LatLng? currentLatLng =
        (widget.currentLat != null && widget.currentLng != null)
            ? LatLng(widget.currentLat!, widget.currentLng!)
            : null;

    final LatLng? destinationLatLng =
        (widget.latitude != null && widget.longitude != null)
            ? LatLng(widget.latitude!, widget.longitude!)
            : null;

    final CameraPosition initialCamera = CameraPosition(
      target: currentLatLng ?? destinationLatLng ?? defaultPosition,
      zoom: 14.0,
    );

    final Set<Marker> markers = {
      if (currentLatLng != null)
        Marker(
          markerId: const MarkerId('current'),
          position: currentLatLng,
          infoWindow: const InfoWindow(title: 'You Are Here'),
        ),
      if (destinationLatLng != null)
        Marker(
          markerId: const MarkerId('destination'),
          position: destinationLatLng,
          infoWindow: const InfoWindow(title: 'Destination'),
        ),
    };

    final Set<Polyline> polylines =
        (currentLatLng != null && destinationLatLng != null)
            ? {
              Polyline(
                polylineId: const PolylineId('route'),
                visible: true,
                points: [currentLatLng, destinationLatLng],
                color: Colors.blue,
                width: 5,
              ),
            }
            : {};

    return GoogleMap(
      initialCameraPosition: initialCamera,
      onMapCreated: (controller) => mapController = controller,
      markers: markers,
      polylines: polylines,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
    );
  }
}
