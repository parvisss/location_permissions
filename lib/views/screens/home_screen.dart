import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:location_permissions/services/location_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocationData? myLocation;
  @override
  initState() {
    Future.delayed(
      Duration.zero,
      () async {
        await LocationService.fetchCurrentLocation();
        setState(
          () {
            myLocation = LocationService.currentLocation;
          },
        );
        LocationService.fetchLiveLocation().listen((location) {
          setState(() {
            myLocation = location;
          });
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myLocation = LocationService.currentLocation;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          myLocation == null
              ? "Joylashuv ololmadim brat"
              : "Lat: ${myLocation.latitude}   Lan ${myLocation.longitude}",
        ),
      ),
    );
  }
}
