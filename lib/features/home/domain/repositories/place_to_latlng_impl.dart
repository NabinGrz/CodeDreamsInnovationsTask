import 'package:core_dreams_innovations/features/home/data/datasource/latlng_to_place_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/datasource/place_to_latlng_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/repositories/latlng_to_place_repository.dart';
import 'package:core_dreams_innovations/features/home/data/repositories/place_to_latlng_repository.dart';
import '../../data/models/location_model.dart';

class PlaceToLatlngRepositoryImpl extends PlaceToLatLngRepository {
  final PlaceToLatLngDataSource placeToLatLngDataSource;

  PlaceToLatlngRepositoryImpl({required this.placeToLatLngDataSource});

  @override
  Future<LocationModel?> getLatlng(String placeId) async {
    return await placeToLatLngDataSource.getLatlng(placeId);
  }
}
