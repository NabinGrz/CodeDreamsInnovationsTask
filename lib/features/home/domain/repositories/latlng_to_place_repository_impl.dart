import 'package:core_dreams_innovations/features/home/data/datasource/latlng_to_place_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/repositories/latlng_to_place_repository.dart';
import '../../data/models/location_model.dart';

class LatlngRepositoryImpl extends LatlngRepository {
  final LatlngDataSource latlngDataSource;

  LatlngRepositoryImpl({required this.latlngDataSource});
  @override
  Future<LocationModel?> getPlace(String latlng) async {
    return await latlngDataSource.getPlace(latlng);
  }
}
