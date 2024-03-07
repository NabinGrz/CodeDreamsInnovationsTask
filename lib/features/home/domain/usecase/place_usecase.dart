import 'dart:convert';
import 'package:core_dreams_innovations/features/home/data/repositories/place_autocomplete_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../core/constants/app_string.dart';
import '../../data/models/place_model.dart';

class PlaceAutocompleteUseCase {
  final PlaceAutocompleteRepository placeAutocompleteRepository;

  PlaceAutocompleteUseCase({required this.placeAutocompleteRepository});
  Future<PredictionModel?> execute(String placeInput) async {
    return await placeAutocompleteRepository.getPlaces(placeInput);
  }
}
