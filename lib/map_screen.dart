import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final String memberName;

  MapScreen({required this.memberName});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _currentLocation = LatLng(37.7749, -122.4194); // Example location
  final List<LatLng> _routePoints = [
    LatLng(37.7749, -122.4194),
    LatLng(37.7849, -122.4294),
    LatLng(37.7949, -122.4394),
  ]; // Example route

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route - ${widget.memberName}'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('currentLocation'),
            position: _currentLocation,
            infoWindow: InfoWindow(title: 'Current Location'),
          ),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            points: _routePoints,
            color: Colors.blue,
            width: 5,
          ),
        },
      ),
    );
  }
}
