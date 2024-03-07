import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../../../../core/constants/app_string.dart';
import '../../data/models/location_model.dart';

abstract class LatlngDataSource {
  Future<LocationModel?> getPlace(String latlng);
}

class LatlngDataSourceImpl extends LatlngDataSource {
  @override
  Future<LocationModel?> getPlace(String latlng) async {
    try {
      final url = Uri.https(AppString.googleApiUrl, "maps/api/geocode/json",
          {'latlng': Uri.encodeFull(latlng), 'key': AppString.apiKey});
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List<dynamic>;
        return results.map((e) => LocationModel.fromJson(e)).firstWhereOrNull(
            (element) => element.types?.contains("route") ?? false);
      } else {
        throw Exception('Failed to get place from latitude and longitude');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
