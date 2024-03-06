import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widget/permission_dialog.dart';

final locationProvider =
    StateNotifierProvider<MapNotifier, LocationState>((ref) => MapNotifier());

class MapNotifier extends StateNotifier<LocationState> {
  MapNotifier() : super(LocationState(isLoading: false));

  LocationPermission? _locationPermission;
  Future<void> checkLocationPermission(BuildContext context) async {
    _locationPermission = await Geolocator.checkPermission();
    if (_locationPermission == LocationPermission.denied) {
      _requestLocationPermission(context);
    } else if (_locationPermission == LocationPermission.deniedForever) {
      showDialog(
        context: context,
        builder: (context) => PermissionDeniedDialog(
          message: "We need your location permission",
          onPressed: () {
            Geolocator.openAppSettings();
          },
        ),
      );
    } else {
      _getCurrentLocation(context);
    }
  }

  Future<void> _requestLocationPermission(BuildContext context) async {
    _locationPermission = await Geolocator.requestPermission();
    if (_locationPermission == LocationPermission.denied ||
        _locationPermission == LocationPermission.deniedForever) {
      showDialog(
        context: context,
        builder: (context) => PermissionDeniedDialog(
          message: "We need your location permission",
          onPressed: () {
            Geolocator.openAppSettings();
          },
        ),
      );
    } else {
      _getCurrentLocation(context);
    }
  }

  Future<void> _getCurrentLocation(BuildContext context) async {
    try {
      Position position = await Geolocator.getCurrentPosition();

      state = LocationState(
        position: position,
        isLoading: false,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => PermissionDeniedDialog(
          message: "We need your location permission",
          onPressed: () {
            Geolocator.openAppSettings();
          },
        ),
      );
    }
  }
}

class LocationState {
  final bool isLoading;
  final Position? position;

  LocationState({required this.isLoading, this.position});
}
