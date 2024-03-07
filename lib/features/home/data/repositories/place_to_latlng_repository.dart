import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_string.dart';
import '../../data/models/location_model.dart';
import 'package:http/http.dart' as http;

abstract class PlaceToLatLngRepository {
  Future<LocationModel?> getLatlng(String placeId);
}
