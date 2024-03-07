import 'dart:async';
import 'dart:convert';
import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_string.dart';
import 'package:core_dreams_innovations/features/home/data/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../data/models/place_model.dart';
import 'package:collection/collection.dart';

final mapStyleProvider = FutureProvider((ref) async {
  final style = await rootBundle.loadString('assets/json/map_style.json');
  return style;
});
final placesProvider = StateProvider<List<Description>>((ref) => []);
final destinationProvider = StateProvider<LatLng?>((ref) => null);
final startProvider = StateProvider<LatLng?>((ref) => null);
final routePolyPointsProvider = StateProvider<List<PointLatLng>>((ref) => []);
final routesProvider = StateProvider<Polyline>((ref) {
  final polyline = Polyline(
      polylineId: const PolylineId("Routes"),
      color: AppColors.yellowColor,
      width: 6,
      points: ref
          .watch(routePolyPointsProvider)
          .map((e) => LatLng(e.latitude, e.longitude))
          .toList());

  return polyline;
});
final googleApiProvider = ChangeNotifierProvider<GoogleMapAPINotifier>(
    (ref) => GoogleMapAPINotifier());

class GoogleMapAPINotifier extends ChangeNotifier {
  Future<PredictionModel?> placeAutoComplete(
      {required String placeInput}) async {
    try {
      Map<String, dynamic> querys = {
        'input': placeInput,
        'key': AppString.apiKey
      };
      final url = Uri.https(
          AppString.googleApiUrl, "maps/api/place/autocomplete/json", querys);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return PredictionModel.fromJson(jsonDecode(response.body));
      } else {
        response.body;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<LocationModel?> placeToLatLng(String placeId) async {
    try {
      Map<String, dynamic> querys = {
        'place_id': placeId,
        'key': AppString.apiKey
      };
      final url =
          Uri.https(AppString.googleApiUrl, "maps/api/geocode/json", querys);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final test = jsonDecode(response.body);
        final p = LocationModel.fromJson(test['results'][0]);
        return p;
      } else {
        response.body;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<LocationModel?> latlngToPlace(String latlng) async {
    try {
      Map<String, dynamic> querys = {
        'latlng': Uri.encodeFull(latlng),
        'key': AppString.apiKey
      };
      final url =
          Uri.https(AppString.googleApiUrl, "maps/api/geocode/json", querys);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List<dynamic>;
        return results.map((e) => LocationModel.fromJson(e)).firstWhereOrNull(
            (element) => element.types?.contains("route") ?? false);
      } else {
        response.body;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<PointLatLng>> getRouteBetweenTwoPoints(
      {required LatLng start,
      required LatLng end,
      required Color color}) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult res = await polylinePoints.getRouteBetweenCoordinates(
        AppString.apiKey,
        PointLatLng(start.latitude, start.longitude),
        PointLatLng(end.latitude, end.longitude));
    if (res.points.isNotEmpty) {
      return res.points;
    } else {
      return [];
    }
  }

  Future<void> updateCameraLocationToZoomBetweenTwoMarkers(
    LatLng source,
    LatLng destination,
    GoogleMapController mapController,
  ) async {
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
    return checkCameraLocation(cameraUpdate, mapController);
  }

  Future<void> checkCameraLocation(
      CameraUpdate cameraUpdate, GoogleMapController mapController) async {
    await mapController.animateCamera(cameraUpdate);
    LatLngBounds l1 = await mapController.getVisibleRegion();
    LatLngBounds l2 = await mapController.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      return checkCameraLocation(cameraUpdate, mapController);
    }
  }
}
