import '../../data/models/location_model.dart';

abstract class LatlngRepository {
  Future<LocationModel?> getPlace(String latlng);
}
