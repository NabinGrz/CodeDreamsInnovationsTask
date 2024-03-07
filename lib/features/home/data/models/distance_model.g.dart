// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistanceModelImpl _$$DistanceModelImplFromJson(Map<String, dynamic> json) =>
    _$DistanceModelImpl(
      destinationAddresses: (json['destination_addresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originAddresses: (json['origin_addresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$DistanceModelImplToJson(_$DistanceModelImpl instance) =>
    <String, dynamic>{
      'destination_addresses': instance.destinationAddresses,
      'origin_addresses': instance.originAddresses,
      'rows': instance.rows,
      'status': instance.status,
    };

_$RowImpl _$$RowImplFromJson(Map<String, dynamic> json) => _$RowImpl(
      elements: (json['elements'] as List<dynamic>?)
          ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RowImplToJson(_$RowImpl instance) => <String, dynamic>{
      'elements': instance.elements,
    };

_$ElementImpl _$$ElementImplFromJson(Map<String, dynamic> json) =>
    _$ElementImpl(
      distance: json['distance'] == null
          ? null
          : Distance.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : Duration.fromJson(json['duration'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$ElementImplToJson(_$ElementImpl instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'status': instance.status,
    };

_$DistanceImpl _$$DistanceImplFromJson(Map<String, dynamic> json) =>
    _$DistanceImpl(
      text: json['text'] as String?,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$$DistanceImplToJson(_$DistanceImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };

_$DurationImpl _$$DurationImplFromJson(Map<String, dynamic> json) =>
    _$DurationImpl(
      text: json['text'] as String?,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$$DurationImplToJson(_$DurationImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
