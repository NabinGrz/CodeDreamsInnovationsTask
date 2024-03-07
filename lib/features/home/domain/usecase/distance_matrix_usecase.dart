import 'dart:convert';

import 'package:core_dreams_innovations/features/home/data/models/distance_model.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../core/constants/app_string.dart';

class DistanceMatrixUseCase {
  Future<DistanceModel?> execute(
      {required String start, required String end}) async {
    try {
      final url =
          Uri.https(AppString.googleApiUrl, "maps/api/distancematrix/json", {
        'origins': Uri.encodeFull(start),
        'destinations': Uri.encodeFull(end),
        'key': AppString.apiKey
      });
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return DistanceModel.fromJson(data);
      } else {
        throw Exception('Failed to convert coordinates to place');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
