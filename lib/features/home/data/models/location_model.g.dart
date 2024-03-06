// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      address_components: (json['address_components'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      formatted_address: json['formatted_address'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      place_id: json['place_id'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'address_components': instance.address_components,
      'formatted_address': instance.formatted_address,
      'geometry': instance.geometry,
      'place_id': instance.place_id,
      'types': instance.types,
    };

_$AddressComponentImpl _$$AddressComponentImplFromJson(
        Map<String, dynamic> json) =>
    _$AddressComponentImpl(
      long_name: json['long_name'] as String?,
      short_name: json['short_name'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$AddressComponentImplToJson(
        _$AddressComponentImpl instance) =>
    <String, dynamic>{
      'long_name': instance.long_name,
      'short_name': instance.short_name,
      'types': instance.types,
    };

_$GeometryImpl _$$GeometryImplFromJson(Map<String, dynamic> json) =>
    _$GeometryImpl(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      location_type: json['location_type'] as String?,
      viewport: json['viewport'] == null
          ? null
          : Viewport.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeometryImplToJson(_$GeometryImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'location_type': instance.location_type,
      'viewport': instance.viewport,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$ViewportImpl _$$ViewportImplFromJson(Map<String, dynamic> json) =>
    _$ViewportImpl(
      northeast: json['northeast'] == null
          ? null
          : Location.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : Location.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViewportImplToJson(_$ViewportImpl instance) =>
    <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };
