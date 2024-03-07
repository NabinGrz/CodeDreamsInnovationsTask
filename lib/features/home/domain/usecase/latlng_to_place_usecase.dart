import 'package:core_dreams_innovations/features/home/data/repositories/latlng_to_place_repository.dart';
import '../../data/models/location_model.dart';

class LatLngToPlaceUseCase {
  final LatlngRepository latlngRepository;

  LatLngToPlaceUseCase({required this.latlngRepository});
  Future<LocationModel?> execute(String latlng) async {
    return await latlngRepository.getPlace(latlng);
  }
}
