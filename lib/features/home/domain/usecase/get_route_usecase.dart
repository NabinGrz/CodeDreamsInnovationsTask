import 'package:core_dreams_innovations/features/home/data/repositories/route_repository.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GetRouteUseCase {
  final RouteRepository routeRepository;

  GetRouteUseCase({required this.routeRepository});
  Future<List<PointLatLng>> execute(
      {required LatLng start, required LatLng end}) async {
    return await routeRepository.getRoutes(start: start, end: end);
  }
}
