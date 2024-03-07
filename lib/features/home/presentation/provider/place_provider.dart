import 'dart:async';
import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/latlng_to_place_usecase.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/place_to_latlng_usecase.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/place_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../shared/utils/utils.dart';

import '../../domain/entities/place_latlng_model.dart';
import '../../domain/usecase/get_route_usecase.dart';
import '../../domain/usecase/update_camera_location_usecase.dart';

final mapStyleProvider = FutureProvider((ref) async {
  final style = await rootBundle.loadString('assets/json/map_style.json');
  return style;
});
final startIconProvider = FutureProvider((ref) async {
  return BitmapDescriptor.fromBytes(
      await getBytesFromAsset(path: "assets/images/start.png", width: 140));
});
final destinationIconProvider = FutureProvider((ref) async {
  return BitmapDescriptor.fromBytes(await getBytesFromAsset(
      path: "assets/images/destination.png", width: 140));
});

final startProvider = StateProvider<PlaceLatLngModel?>((ref) => null);
final routePolyPointsProvider = StateProvider<List<PointLatLng>>((ref) => []);
final routesProvider = StateProvider<Polyline?>((ref) {
  final polyline = Polyline(
      polylineId: const PolylineId("Routes"),
      color: AppColors.yellowColor,
      width: 3,
      points: ref
          .watch(routePolyPointsProvider)
          .map((e) => LatLng(e.latitude, e.longitude))
          .toList());

  return polyline;
});
final googleApiProvider = ChangeNotifierProvider<GoogleMapAPINotifier>((ref) {
  final getRouteUseCase = ref.read(getRouteUseCaseProvider);
  final updateCameraUseCase = ref.read(updateCameraUseCaseProvider);
  return GoogleMapAPINotifier(
      getRouteUseCase: getRouteUseCase,
      updateCameraUseCase: updateCameraUseCase);
});

final placeUseCaseProvider = Provider((ref) => PlaceAutocompleteUseCase());
final placeToLatLngUseCaseProvider = Provider((ref) => PlaceToLatLngUseCase());
final latlngToPlaceUseCaseProvider = Provider((ref) => LatLngToPlaceUseCase());
final getRouteUseCaseProvider = Provider((ref) => GetRouteUseCase());
final updateCameraUseCaseProvider = Provider((ref) => UpdateCameraUseCase());

class GoogleMapAPINotifier extends ChangeNotifier {
  final GetRouteUseCase getRouteUseCase;
  final UpdateCameraUseCase updateCameraUseCase;
  GoogleMapAPINotifier({
    required this.getRouteUseCase,
    required this.updateCameraUseCase,
  });

  Future<List<PointLatLng>> getRouteBetweenTwoPoints(
      {required LatLng start,
      required LatLng end,
      required Color color}) async {
    print(start);
    print(end);
    return await getRouteUseCase.execute(start: start, end: end);
  }

  Future<void> updateCameraLocationToZoomBetweenTwoMarkers(
    LatLng source,
    LatLng destination,
    GoogleMapController mapController,
  ) async =>
      await updateCameraUseCase.execute(source, destination, mapController);
}
