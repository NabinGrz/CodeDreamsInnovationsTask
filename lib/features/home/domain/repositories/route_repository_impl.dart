import 'package:core_dreams_innovations/features/home/data/datasource/route_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/repositories/route_repository.dart';
import 'package:flutter_polyline_points/src/PointLatLng.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';


class RouteRepositoryImpl implements RouteRepository {
  final RouteDataSource routeDataSource;

  RouteRepositoryImpl({required this.routeDataSource});

  @override
  Future<List<PointLatLng>> getRoutes(
      {required LatLng start, required LatLng end}) async {
    return await routeDataSource.getRoutes(start: start, end: end);
  }
}
