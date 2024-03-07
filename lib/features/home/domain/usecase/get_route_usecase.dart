import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_string.dart';

class GetRouteUseCase {
  Future<List<PointLatLng>> execute(
      {required LatLng start, required LatLng end}) async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult res = await polylinePoints.getRouteBetweenCoordinates(
          AppString.apiKey,
          PointLatLng(start.latitude, start.longitude),
          PointLatLng(end.latitude, end.longitude));

      if (res.points.isNotEmpty) {
        return res.points;
      } else {
        return []; // Return empty list if no route found
      }
    } catch (e) {
      // Handle exception
      debugPrint(e.toString());
      rethrow; // Rethrow the exception for higher-level handling
    }
  }
}
