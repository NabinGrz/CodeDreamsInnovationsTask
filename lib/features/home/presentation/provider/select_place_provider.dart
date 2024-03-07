import 'package:core_dreams_innovations/features/home/presentation/provider/place_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/location_model.dart';
import '../../data/models/place_model.dart';
import '../../domain/entities/place_latlng_model.dart';
import '../../domain/usecase/place_to_latlng_usecase.dart';
import 'search_place_provider.dart';

final selectPlaceProvider =
    StateNotifierProvider<SelectPlaceNotifier, PlaceLatLngModel?>(
        (ref) => SelectPlaceNotifier(ref.read(placeToLatLngUseCaseProvider)));

class SelectPlaceNotifier extends StateNotifier<PlaceLatLngModel?> {
  final PlaceToLatLngUseCase placeToLatLngUseCase;
  SelectPlaceNotifier(this.placeToLatLngUseCase) : super(null);
  Future<LocationModel?> placeToLatLng(String placeId) async {
    return await placeToLatLngUseCase.execute(placeId);
  }

  Future<void> onSelectPlace(Description place, WidgetRef ref) async {
    ref.read(searchPlaceProvider.notifier).clearSuggestions();
    final location = await placeToLatLng(place.place_id ?? "");
    final latlng = LatLng(
      location?.geometry?.location?.lat ?? 0,
      location?.geometry?.location?.lng ?? 0,
    );
    state = PlaceLatLngModel(description: place, latLng: latlng);
  }
}
