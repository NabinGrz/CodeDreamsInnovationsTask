import 'dart:async';
import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/features/home/data/models/location_model.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/latlng_to_place_usecase.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/place_to_latlng_usecase.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/place_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/place_model.dart';
import 'dart:ui' as ui;

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

Future<Uint8List> getBytesFromAsset(
    {required String path, required int width}) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

final placesProvider = StateProvider<List<Description>>((ref) => []);
final destinationProvider = StateProvider<PlaceLatLngModel?>((ref) => null);
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
  final placeUseCase = ref.read(placeUseCaseProvider);
  final placeToLatLngUseCase = ref.read(placeToLatLngUseCaseProvider);
  final latLngToPlaceUseCase = ref.read(latlngToPlaceUseCaseProvider);
  final getRouteUseCase = ref.read(getRouteUseCaseProvider);
  final updateCameraUseCase = ref.read(updateCameraUseCaseProvider);
  return GoogleMapAPINotifier(
      getRouteUseCase: getRouteUseCase,
      placeUseCase: placeUseCase,
      placeToLatLngUseCase: placeToLatLngUseCase,
      latLngToPlaceUseCase: latLngToPlaceUseCase,
      updateCameraUseCase: updateCameraUseCase);
});

final placeUseCaseProvider = Provider((ref) => PlaceAutocompleteUseCase());
final placeToLatLngUseCaseProvider = Provider((ref) => PlaceToLatLngUseCase());
final latlngToPlaceUseCaseProvider = Provider((ref) => LatLngToPlaceUseCase());
final getRouteUseCaseProvider = Provider((ref) => GetRouteUseCase());
final updateCameraUseCaseProvider = Provider((ref) => UpdateCameraUseCase());

class GoogleMapAPINotifier extends ChangeNotifier {
  final PlaceAutocompleteUseCase placeUseCase;
  final PlaceToLatLngUseCase placeToLatLngUseCase;
  final LatLngToPlaceUseCase latLngToPlaceUseCase;
  final GetRouteUseCase getRouteUseCase;
  final UpdateCameraUseCase updateCameraUseCase;
  GoogleMapAPINotifier(
      {required this.latLngToPlaceUseCase,
      required this.placeToLatLngUseCase,
      required this.getRouteUseCase,
      required this.updateCameraUseCase,
      required this.placeUseCase});
  Future<PredictionModel?> placeAutoComplete(
      {required String placeInput}) async {
    return await placeUseCase.execute(placeInput);
  }

  Future<LocationModel?> placeToLatLng(String placeId) async {
    return await placeToLatLngUseCase.execute(placeId);
  }

  Future<LocationModel?> latlngToPlace(String latlng) async {
    return await latLngToPlaceUseCase.execute(latlng);
  }

  Future<List<PointLatLng>> getRouteBetweenTwoPoints(
      {required LatLng start,
      required LatLng end,
      required Color color}) async {
    return await getRouteUseCase.execute(start: start, end: end);
  }

  Future<void> updateCameraLocationToZoomBetweenTwoMarkers(
    LatLng source,
    LatLng destination,
    GoogleMapController mapController,
  ) async =>
      await updateCameraUseCase.execute(source, destination, mapController);

  Future<void> searchPlace(String pattern, WidgetRef ref) async {
    if (pattern.length >= 3) {
      var predictionModel = await placeAutoComplete(placeInput: pattern);
      if (predictionModel != null) {
        final places = predictionModel.predictions!
            .where((element) => element.description!
                .toLowerCase()
                .contains(pattern.toLowerCase()))
            .toList();
        ref.read(placesProvider.notifier).update((state) => places);
      }
    } else {
      ref.read(placesProvider.notifier).update((state) => []);
    }
  }

  Future<void> onSelectPlace(Description place, WidgetRef ref) async {
    ref.read(placesProvider.notifier).update((state) => []);
    final location = await placeToLatLng(place.place_id ?? "");
    final latlng = LatLng(
      location?.geometry?.location?.lat ?? 0,
      location?.geometry?.location?.lng ?? 0,
    );
    ref.read(destinationProvider.notifier).update(
        (state) => PlaceLatLngModel(description: place, latLng: latlng));
  }
}
