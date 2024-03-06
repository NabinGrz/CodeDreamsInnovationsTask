// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressComponentDetailImpl _$$AddressComponentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$AddressComponentDetailImpl(
      long_name: json['long_name'] as String?,
      short_name: json['short_name'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$AddressComponentDetailImplToJson(
        _$AddressComponentDetailImpl instance) =>
    <String, dynamic>{
      'long_name': instance.long_name,
      'short_name': instance.short_name,
      'types': instance.types,
    };

_$ResultsModelImpl _$$ResultsModelImplFromJson(Map<String, dynamic> json) =>
    _$ResultsModelImpl(
      address_components: (json['address_components'] as List<dynamic>?)
          ?.map(
              (e) => AddressComponentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      formatted_address: json['formatted_address'] as String?,
      geometry: json['geometry'] == null
          ? null
          : GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultsModelImplToJson(_$ResultsModelImpl instance) =>
    <String, dynamic>{
      'address_components': instance.address_components,
      'formatted_address': instance.formatted_address,
      'geometry': instance.geometry,
    };

_$GeometryModelImpl _$$GeometryModelImplFromJson(Map<String, dynamic> json) =>
    _$GeometryModelImpl(
      location: json['location'] == null
          ? null
          : LatlngModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeometryModelImplToJson(_$GeometryModelImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

_$PlusCodeModelImpl _$$PlusCodeModelImplFromJson(Map<String, dynamic> json) =>
    _$PlusCodeModelImpl(
      compound_code: json['compound_code'] as String?,
      global_code: json['global_code'] as String?,
    );

Map<String, dynamic> _$$PlusCodeModelImplToJson(_$PlusCodeModelImpl instance) =>
    <String, dynamic>{
      'compound_code': instance.compound_code,
      'global_code': instance.global_code,
    };

_$PlaceDetailModelImpl _$$PlaceDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceDetailModelImpl(
      plus_code: json['plus_code'] == null
          ? null
          : PlusCodeModel.fromJson(json['plus_code'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$PlaceDetailModelImplToJson(
        _$PlaceDetailModelImpl instance) =>
    <String, dynamic>{
      'plus_code': instance.plus_code,
      'results': instance.results,
      'status': instance.status,
    };

_$LatlngModelImpl _$$LatlngModelImplFromJson(Map<String, dynamic> json) =>
    _$LatlngModelImpl(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LatlngModelImplToJson(_$LatlngModelImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$DescriptionImpl _$$DescriptionImplFromJson(Map<String, dynamic> json) =>
    _$DescriptionImpl(
      description: json['description'] as String?,
      place_id: json['place_id'] as String?,
      structured_formatting: json['structured_formatting'] == null
          ? null
          : StrucuredFormatting.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DescriptionImplToJson(_$DescriptionImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'place_id': instance.place_id,
      'structured_formatting': instance.structured_formatting,
    };

_$StrucuredFormattingImpl _$$StrucuredFormattingImplFromJson(
        Map<String, dynamic> json) =>
    _$StrucuredFormattingImpl(
      main_text: json['main_text'] as String?,
      secondary_text: json['secondary_text'] as String?,
    );

Map<String, dynamic> _$$StrucuredFormattingImplToJson(
        _$StrucuredFormattingImpl instance) =>
    <String, dynamic>{
      'main_text': instance.main_text,
      'secondary_text': instance.secondary_text,
    };

_$PredictionModelImpl _$$PredictionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictionModelImpl(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PredictionModelImplToJson(
        _$PredictionModelImpl instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
    };
