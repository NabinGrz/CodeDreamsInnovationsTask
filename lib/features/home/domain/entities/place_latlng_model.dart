import 'package:core_dreams_innovations/features/home/data/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLatLngModel {
  final Description description;
  final LatLng latLng;

  PlaceLatLngModel({required this.description, required this.latLng});
}
