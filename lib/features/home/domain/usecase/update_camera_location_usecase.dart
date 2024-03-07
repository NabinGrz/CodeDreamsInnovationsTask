import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class UpdateCameraUseCase {
  Future<void> execute(LatLng source, LatLng destination,
      GoogleMapController mapController) async {
    try {
      LatLngBounds bounds;
      if (source.latitude > destination.latitude &&
          source.longitude > destination.longitude) {
        bounds = LatLngBounds(southwest: destination, northeast: source);
      } else if (source.longitude > destination.longitude) {
        bounds = LatLngBounds(
            southwest: LatLng(source.latitude, destination.longitude),
            northeast: LatLng(destination.latitude, source.longitude));
      } else if (source.latitude > destination.latitude) {
        bounds = LatLngBounds(
            southwest: LatLng(destination.latitude, source.longitude),
            northeast: LatLng(source.latitude, destination.longitude));
      } else {
        bounds = LatLngBounds(southwest: source, northeast: destination);
      }

      CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 120);
      await mapController.animateCamera(cameraUpdate);
    } catch (e) {
      // Handle exception
      debugPrint(e.toString());
      rethrow; // Rethrow the exception for higher-level handling
    }
  }
}
