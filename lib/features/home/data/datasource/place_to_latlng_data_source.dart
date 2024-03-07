import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_string.dart';
import '../../data/models/location_model.dart';
import 'package:http/http.dart' as http;

abstract class PlaceToLatLngDataSource {
  Future<LocationModel?> getLatlng(String placeId);
}

class PlaceToLatLngDataSourceImpl implements PlaceToLatLngDataSource {
  @override
  Future<LocationModel?> getLatlng(String placeId) async {
    try {
      final url = Uri.https(AppString.googleApiUrl, "maps/api/geocode/json",
          {'place_id': placeId, 'key': AppString.apiKey});
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final test = jsonDecode(response.body);
        final p = LocationModel.fromJson(test['results'][0]);
        return p;
      } else {
        throw Exception('Failed to latitude and longitude of place');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
