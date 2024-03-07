
import 'package:core_dreams_innovations/features/home/data/repositories/place_to_latlng_repository.dart';

import '../../data/models/location_model.dart';

class PlaceToLatLngUseCase {
  final PlaceToLatLngRepository placeToLatLngRepository;

  PlaceToLatLngUseCase({required this.placeToLatLngRepository});
  Future<LocationModel?> execute(String placeId) async {
    return await placeToLatLngRepository.getLatlng(placeId);
  }
}
