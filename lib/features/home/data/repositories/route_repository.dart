import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


abstract class RouteRepository {
  Future<List<PointLatLng>> getRoutes(
      {required LatLng start, required LatLng end});
}