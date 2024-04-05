import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddLocationMap extends StatefulWidget {
  final void Function(LatLng)? onLocationSelected;
  const AddLocationMap({super.key,this.onLocationSelected});

  @override
  State<AddLocationMap> createState() => AddLocationMapState();
}

class AddLocationMapState extends State<AddLocationMap> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  late LatLng _initialCameraPosition;
  static late LatLng _selectedLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _initialCameraPosition = const LatLng(37.42796133580664, -122.085749655962);
    _selectedLocation = _initialCameraPosition;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  Future<void> _goToLocation(LocationData locationData) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 15.0,
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData? locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    _goToLocation(locationData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _initialCameraPosition,
              zoom: 14.0,
            ),
            onMapCreated: _onMapCreated,
            markers: _markers,
            onTap: (LatLng location) {
              setState(() {
                _selectedLocation = location;
                _markers = {
                  Marker(
                    markerId: const MarkerId('selectedLocation'),
                    position: location,
                  ),
                };
              });
              if (widget.onLocationSelected != null) {
                widget.onLocationSelected!(_selectedLocation);
              }
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Positioned(
              top: 7,
              right: 10,
              child: IconButton(
                onPressed: () => _getCurrentLocation(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: Colors.black,
                    padding: const EdgeInsets.only(right: 1,bottom: 1)
                ),
                icon: const ImageIcon(AssetImage("assets/images/current-location.png"),color: Color(0xFF0D4A64),size: 22,),)
          )
        ],
      ),
    );
  }
}