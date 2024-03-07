import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../core/constants/app_string.dart';
import '../../data/models/place_model.dart';

class PlaceAutocompleteUseCase {
  Future<PredictionModel?> execute(String placeInput) async {
    try {
      final url = Uri.https(
          AppString.googleApiUrl,
          "maps/api/place/autocomplete/json",
          {'input': placeInput, 'key': AppString.apiKey});
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return PredictionModel.fromJson(jsonDecode(response.body));
      } else {
        // Handle error response
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      // Handle exception
      debugPrint(e.toString());
      rethrow; // Rethrow the exception for higher-level handling
    }
  }
}
