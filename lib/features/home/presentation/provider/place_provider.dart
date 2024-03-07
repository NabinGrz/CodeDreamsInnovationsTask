import 'dart:async';
import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/features/home/data/datasource/latlng_to_place_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/datasource/place_auto_complete_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/datasource/place_to_latlng_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/datasource/route_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/repositories/place_autocomplete_repository.dart';
import 'package:core_dreams_innovations/features/home/data/repositories/route_repository.dart';
import 'package:core_dreams_innovations/features/home/domain/repositories/latlng_to_place_repository_impl.dart';
import 'package:core_dreams_innovations/features/home/domain/repositories/place_auto_complete_impl.dart';
import 'package:core_dreams_innovations/features/home/domain/repositories/place_to_latlng_impl.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/latlng_to_place_usecase.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/place_to_latlng_usecase.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/place_usecase.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/location_provider.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/search_place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../shared/utils/utils.dart';

import '../../data/repositories/latlng_to_place_repository.dart';
import '../../domain/entities/place_latlng_model.dart';
import '../../domain/repositories/route_repository_impl.dart';
import '../../domain/usecase/get_route_usecase.dart';
import '../../domain/usecase/update_camera_location_usecase.dart';
import 'distance_matrix_provider.dart';

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
  final routes = ref.watch(routePolyPointsProvider);
  final polyline = Polyline(
      polylineId: const PolylineId("Routes"),
      color: AppColors.yellowColor,
      width: 3,
      points: routes.map((e) => LatLng(e.latitude, e.longitude)).toList());

  return polyline;
});
final googleApiProvider = ChangeNotifierProvider<GoogleMapAPINotifier>((ref) {
  final getRouteUseCase = ref.read(getRouteUseCaseProvider);
  final updateCameraUseCase = ref.read(updateCameraUseCaseProvider);
  return GoogleMapAPINotifier(
      getRouteUseCase: getRouteUseCase,
      updateCameraUseCase: updateCameraUseCase);
});

final placeDataSourceProvider = Provider<PlaceAutocompleteDataSource>(
    (ref) => PlaceAutocompleteDataSourceImpl());
final placeRepositoryProvider = Provider<PlaceAutocompleteRepository>((ref) =>
    PlaceAutocompleteRepositoryImpl(
        placeAutocompleteDataSource: ref.read(placeDataSourceProvider)));
final placeUseCaseProvider = Provider((ref) => PlaceAutocompleteUseCase(
    placeAutocompleteRepository: ref.read(placeRepositoryProvider)));

final placeToLatLngDataSourceProvider =
    Provider<PlaceToLatLngDataSource>((ref) => PlaceToLatLngDataSourceImpl());
final placeToLatLngRepositoryProvider = Provider((ref) =>
    PlaceToLatlngRepositoryImpl(
        placeToLatLngDataSource: ref.read(placeToLatLngDataSourceProvider)));
final placeToLatLngUseCaseProvider = Provider((ref) => PlaceToLatLngUseCase(
    placeToLatLngRepository: ref.read(placeToLatLngRepositoryProvider)));

final latlngDataSourceProvider =
    Provider<LatlngDataSource>((ref) => LatlngDataSourceImpl());
final latlngRepositoryProvider = Provider<LatlngRepository>((ref) =>
    LatlngRepositoryImpl(latlngDataSource: ref.read(latlngDataSourceProvider)));
final latlngToPlaceUseCaseProvider = Provider((ref) =>
    LatLngToPlaceUseCase(latlngRepository: ref.read(latlngRepositoryProvider)));
final getRouteUseCaseProvider = Provider((ref) =>
    GetRouteUseCase(routeRepository: ref.read(routeRepositoryProvider)));
final routeRepositoryProvider = Provider<RouteRepository>((ref) =>
    RouteRepositoryImpl(routeDataSource: ref.read(routeDataSourceProvider)));
final routeDataSourceProvider =
    Provider<RouteDataSource>((ref) => RouteDataSourceImpl());
final updateCameraUseCaseProvider = Provider((ref) => UpdateCameraUseCase());

//** Provider for getting routes, update camera position and handling on done function */
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
    return await getRouteUseCase.execute(start: start, end: end);
  }

  Future<void> updateCameraLocationToZoomBetweenTwoMarkers(
    LatLng source,
    LatLng destination,
    GoogleMapController mapController,
  ) async =>
      await updateCameraUseCase.execute(source, destination, mapController);

  Future<void> onDone(
      WidgetRef ref,
      DraggableScrollableController dragController,
      TextEditingController destinationController,
      LocationState locationState,
      GoogleMapController? mapController,
      PlaceLatLngModel? destinationModel) async {
    ref.read(routePolyPointsProvider.notifier).update((state) => []);
    ref.read(routesProvider.notifier).update((state) => null);
    dragController.animateTo(0.3,
        duration: const Duration(
          milliseconds: 300,
        ),
        curve: Curves.easeInOut);
    destinationController.clear();
    ref.read(searchPlaceProvider.notifier).clearSuggestions();
    final start = LatLng(
        locationState.position!.latitude, locationState.position!.longitude);
    final end = destinationModel?.latLng;
    if (end != null) {
      await getRouteBetweenTwoPoints(
              start: start, end: end, color: AppColors.yellowColor)
          .then((value) async {
        ref.read(routePolyPointsProvider.notifier).update((state) => value);
        if (mapController != null) {
          await updateCameraLocationToZoomBetweenTwoMarkers(
              start, end, mapController);
        }
        await ref.read(distanceMatrixProvider.notifier).getDistance(
            start: "${start.latitude},${start.longitude}",
            end: "${end.latitude},${end.longitude}");
      });
    }
  }
}
