

import '../../data/models/location_model.dart';

abstract class PlaceToLatLngRepository {
  Future<LocationModel?> getLatlng(String placeId);
}
