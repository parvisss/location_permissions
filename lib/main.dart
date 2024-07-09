import 'package:flutter/material.dart';
import 'package:location_permissions/services/location_service.dart';
import 'package:location_permissions/views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // PermissionStatus cameraPermission = await Permission.camera.status;
  // PermissionStatus locationPermission = await Permission.location.status;
  // print(cameraPermission);
  // if (cameraPermission == PermissionStatus.denied) {
  //   cameraPermission = await Permission.camera.request();
  // }
  // if (locationPermission == PermissionStatus.denied) {
  //   locationPermission = await Permission.location.request();
  // }
  // final statuses = await [
  //   Permission.camera,
  //   Permission.location,
  // ].request();
  // print(statuses);
  // print(statuses[Permission.location]);
  await LocationService.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
