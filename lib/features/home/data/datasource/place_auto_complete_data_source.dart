import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../core/constants/app_string.dart';
import '../../data/models/place_model.dart';

abstract class PlaceAutocompleteDataSource {
  Future<PredictionModel?> getPlaces(String placeInput);
}

class PlaceAutocompleteDataSourceImpl implements PlaceAutocompleteDataSource {
  @override
  Future<PredictionModel?> getPlaces(String placeInput) async {
    try {
      final url = Uri.https(
          AppString.googleApiUrl,
          "maps/api/place/autocomplete/json",
          {'input': placeInput, 'key': AppString.apiKey});
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return PredictionModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
