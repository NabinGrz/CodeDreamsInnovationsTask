import '../models/place_model.dart';

abstract class PlaceAutocompleteRepository {
  Future<PredictionModel?> getPlaces(String placeInput);
}
