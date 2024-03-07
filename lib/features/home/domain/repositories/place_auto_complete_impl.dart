import 'package:core_dreams_innovations/features/home/data/datasource/place_auto_complete_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/repositories/place_autocomplete_repository.dart';

import '../../data/models/place_model.dart';

class PlaceAutocompleteRepositoryImpl implements PlaceAutocompleteRepository {
  final PlaceAutocompleteDataSource placeAutocompleteDataSource;

  PlaceAutocompleteRepositoryImpl({required this.placeAutocompleteDataSource});
  @override
  Future<PredictionModel?> getPlaces(String placeInput) async {
    return await placeAutocompleteDataSource.getPlaces(placeInput);
  }
}
