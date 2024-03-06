import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    List<AddressComponent>? address_components,
    String? formatted_address,
    Geometry? geometry,
    String? place_id,
    List<String>? types,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@freezed
class AddressComponent with _$AddressComponent {
  const factory AddressComponent({
    String? long_name,
    String? short_name,
    List<String>? types,
  }) = _AddressComponent;

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentFromJson(json);
}

@freezed
class Geometry with _$Geometry {
  const factory Geometry({
    Location? location,
    String? location_type,
    Viewport? viewport,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    double? lat,
    double? lng,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Viewport with _$Viewport {
  const factory Viewport({
    Location? northeast,
    Location? southwest,
  }) = _Viewport;

  factory Viewport.fromJson(Map<String, dynamic> json) =>
      _$ViewportFromJson(json);
}
