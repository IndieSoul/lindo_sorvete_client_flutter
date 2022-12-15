import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lindosorveteclient/pages/home/home_controller.dart';

class MapHome extends StatefulWidget {
  const MapHome({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = {};

  final CameraPosition _ecatepec = const CameraPosition(
    target: LatLng(19.514991, -99.035727),
    zoom: 14.5,
  );

  @override
  void initState() {
    determinePosition();
    super.initState();
  }

  void addMarkerIceCream({required LatLng position}) async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(30, 40)),
      "assets/markers/ice_cream_marker.png",
    );

    markers.add(
      Marker(
        markerId: const MarkerId('Prueba'),
        position: position,
        icon: markerbitmap,
        anchor: const Offset(0.5, 1),
        infoWindow: InfoWindow(
          title: 'Marcador de prueba',
          snippet: 'Informacion util',
          onTap: () {},
        ),
      ),
    );

    setState(() {});
  }

  void addMarkerBlue({required LatLng position}) async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(30, 40)),
      "assets/markers/blue_marker.png",
    );

    markers.add(
      Marker(
        markerId: const MarkerId('ubicacion'),
        position: position,
        icon: markerbitmap,
        anchor: const Offset(0.5, 1),
        infoWindow: InfoWindow(
          title: 'Ubicación',
          snippet: 'Esta es tu ubicación.',
          onTap: () {},
        ),
      ),
    );

    setState(() {});
  }

  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    widget.homeController.currentPosition =
        await Geolocator.getCurrentPosition();
    widget.homeController.currentLocation = GeoPoint(
        widget.homeController.currentPosition!.latitude,
        widget.homeController.currentPosition!.longitude);

    addMarkerBlue(
      position: LatLng(
        widget.homeController.currentLocation!.latitude,
        widget.homeController.currentLocation!.longitude,
      ),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: SizedBox(
        height: size.height * 0.5,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _ecatepec,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (argument) {
              addMarkerIceCream(position: argument);
            },
            markers: markers,
          ),
        ),
      ),
    );
  }
}
