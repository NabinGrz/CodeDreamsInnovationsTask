import 'package:core_dreams_innovations/features/home/data/models/location_model.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/latlng_to_place_usecase.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/place_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final latlngProvider = StateNotifierProvider<LatLngNotifier, LocationModel?>(
    (ref) => LatLngNotifier(ref.read(latlngToPlaceUseCaseProvider)));

class LatLngNotifier extends StateNotifier<LocationModel?> {
  final LatLngToPlaceUseCase latLngToPlaceUseCase;
  LatLngNotifier(this.latLngToPlaceUseCase) : super(null);

  Future<void> latlngToPlace(String latlng) async {
    state = await latLngToPlaceUseCase.execute(latlng);
  }
}
