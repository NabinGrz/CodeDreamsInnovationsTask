import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_model.freezed.dart';
part 'distance_model.g.dart';

@freezed
abstract class DistanceModel with _$DistanceModel {
  const factory DistanceModel({
    @JsonKey(name: 'destination_addresses') List<String>? destinationAddresses,
    @JsonKey(name: 'origin_addresses') List<String>? originAddresses,
    @JsonKey(name: 'rows') List<Row>? rows,
    @JsonKey(name: 'status') String? status,
  }) = _DistanceModel;

  factory DistanceModel.fromJson(Map<String, dynamic> json) =>
      _$DistanceModelFromJson(json);
}

@freezed
abstract class Row with _$Row {
  const factory Row({
    @JsonKey(name: 'elements') List<Element>? elements,
  }) = _Row;

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}

@freezed
abstract class Element with _$Element {
  const factory Element({
    @JsonKey(name: 'distance') Distance? distance,
    @JsonKey(name: 'duration') Duration? duration,
    @JsonKey(name: 'status') String? status,
  }) = _Element;

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);
}

@freezed
abstract class Distance with _$Distance {
  const factory Distance({
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'value') int? value,
  }) = _Distance;

  factory Distance.fromJson(Map<String, dynamic> json) =>
      _$DistanceFromJson(json);
}

@freezed
abstract class Duration with _$Duration {
  const factory Duration({
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'value') int? value,
  }) = _Duration;

  factory Duration.fromJson(Map<String, dynamic> json) =>
      _$DurationFromJson(json);
}
