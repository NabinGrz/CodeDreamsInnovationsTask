// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DistanceModel _$DistanceModelFromJson(Map<String, dynamic> json) {
  return _DistanceModel.fromJson(json);
}

/// @nodoc
mixin _$DistanceModel {
  @JsonKey(name: 'destination_addresses')
  List<String>? get destinationAddresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_addresses')
  List<String>? get originAddresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'rows')
  List<Row>? get rows => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistanceModelCopyWith<DistanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceModelCopyWith<$Res> {
  factory $DistanceModelCopyWith(
          DistanceModel value, $Res Function(DistanceModel) then) =
      _$DistanceModelCopyWithImpl<$Res, DistanceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'destination_addresses')
      List<String>? destinationAddresses,
      @JsonKey(name: 'origin_addresses') List<String>? originAddresses,
      @JsonKey(name: 'rows') List<Row>? rows,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class _$DistanceModelCopyWithImpl<$Res, $Val extends DistanceModel>
    implements $DistanceModelCopyWith<$Res> {
  _$DistanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationAddresses = freezed,
    Object? originAddresses = freezed,
    Object? rows = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      destinationAddresses: freezed == destinationAddresses
          ? _value.destinationAddresses
          : destinationAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      originAddresses: freezed == originAddresses
          ? _value.originAddresses
          : originAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rows: freezed == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<Row>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistanceModelImplCopyWith<$Res>
    implements $DistanceModelCopyWith<$Res> {
  factory _$$DistanceModelImplCopyWith(
          _$DistanceModelImpl value, $Res Function(_$DistanceModelImpl) then) =
      __$$DistanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'destination_addresses')
      List<String>? destinationAddresses,
      @JsonKey(name: 'origin_addresses') List<String>? originAddresses,
      @JsonKey(name: 'rows') List<Row>? rows,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class __$$DistanceModelImplCopyWithImpl<$Res>
    extends _$DistanceModelCopyWithImpl<$Res, _$DistanceModelImpl>
    implements _$$DistanceModelImplCopyWith<$Res> {
  __$$DistanceModelImplCopyWithImpl(
      _$DistanceModelImpl _value, $Res Function(_$DistanceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationAddresses = freezed,
    Object? originAddresses = freezed,
    Object? rows = freezed,
    Object? status = freezed,
  }) {
    return _then(_$DistanceModelImpl(
      destinationAddresses: freezed == destinationAddresses
          ? _value._destinationAddresses
          : destinationAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      originAddresses: freezed == originAddresses
          ? _value._originAddresses
          : originAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rows: freezed == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<Row>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistanceModelImpl implements _DistanceModel {
  const _$DistanceModelImpl(
      {@JsonKey(name: 'destination_addresses')
      final List<String>? destinationAddresses,
      @JsonKey(name: 'origin_addresses') final List<String>? originAddresses,
      @JsonKey(name: 'rows') final List<Row>? rows,
      @JsonKey(name: 'status') this.status})
      : _destinationAddresses = destinationAddresses,
        _originAddresses = originAddresses,
        _rows = rows;

  factory _$DistanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistanceModelImplFromJson(json);

  final List<String>? _destinationAddresses;
  @override
  @JsonKey(name: 'destination_addresses')
  List<String>? get destinationAddresses {
    final value = _destinationAddresses;
    if (value == null) return null;
    if (_destinationAddresses is EqualUnmodifiableListView)
      return _destinationAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _originAddresses;
  @override
  @JsonKey(name: 'origin_addresses')
  List<String>? get originAddresses {
    final value = _originAddresses;
    if (value == null) return null;
    if (_originAddresses is EqualUnmodifiableListView) return _originAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Row>? _rows;
  @override
  @JsonKey(name: 'rows')
  List<Row>? get rows {
    final value = _rows;
    if (value == null) return null;
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'DistanceModel(destinationAddresses: $destinationAddresses, originAddresses: $originAddresses, rows: $rows, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistanceModelImpl &&
            const DeepCollectionEquality()
                .equals(other._destinationAddresses, _destinationAddresses) &&
            const DeepCollectionEquality()
                .equals(other._originAddresses, _originAddresses) &&
            const DeepCollectionEquality().equals(other._rows, _rows) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_destinationAddresses),
      const DeepCollectionEquality().hash(_originAddresses),
      const DeepCollectionEquality().hash(_rows),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DistanceModelImplCopyWith<_$DistanceModelImpl> get copyWith =>
      __$$DistanceModelImplCopyWithImpl<_$DistanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistanceModelImplToJson(
      this,
    );
  }
}

abstract class _DistanceModel implements DistanceModel {
  const factory _DistanceModel(
      {@JsonKey(name: 'destination_addresses')
      final List<String>? destinationAddresses,
      @JsonKey(name: 'origin_addresses') final List<String>? originAddresses,
      @JsonKey(name: 'rows') final List<Row>? rows,
      @JsonKey(name: 'status') final String? status}) = _$DistanceModelImpl;

  factory _DistanceModel.fromJson(Map<String, dynamic> json) =
      _$DistanceModelImpl.fromJson;

  @override
  @JsonKey(name: 'destination_addresses')
  List<String>? get destinationAddresses;
  @override
  @JsonKey(name: 'origin_addresses')
  List<String>? get originAddresses;
  @override
  @JsonKey(name: 'rows')
  List<Row>? get rows;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$DistanceModelImplCopyWith<_$DistanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Row _$RowFromJson(Map<String, dynamic> json) {
  return _Row.fromJson(json);
}

/// @nodoc
mixin _$Row {
  @JsonKey(name: 'elements')
  List<Element>? get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RowCopyWith<Row> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowCopyWith<$Res> {
  factory $RowCopyWith(Row value, $Res Function(Row) then) =
      _$RowCopyWithImpl<$Res, Row>;
  @useResult
  $Res call({@JsonKey(name: 'elements') List<Element>? elements});
}

/// @nodoc
class _$RowCopyWithImpl<$Res, $Val extends Row> implements $RowCopyWith<$Res> {
  _$RowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = freezed,
  }) {
    return _then(_value.copyWith(
      elements: freezed == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RowImplCopyWith<$Res> implements $RowCopyWith<$Res> {
  factory _$$RowImplCopyWith(_$RowImpl value, $Res Function(_$RowImpl) then) =
      __$$RowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'elements') List<Element>? elements});
}

/// @nodoc
class __$$RowImplCopyWithImpl<$Res> extends _$RowCopyWithImpl<$Res, _$RowImpl>
    implements _$$RowImplCopyWith<$Res> {
  __$$RowImplCopyWithImpl(_$RowImpl _value, $Res Function(_$RowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = freezed,
  }) {
    return _then(_$RowImpl(
      elements: freezed == elements
          ? _value._elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RowImpl implements _Row {
  const _$RowImpl({@JsonKey(name: 'elements') final List<Element>? elements})
      : _elements = elements;

  factory _$RowImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowImplFromJson(json);

  final List<Element>? _elements;
  @override
  @JsonKey(name: 'elements')
  List<Element>? get elements {
    final value = _elements;
    if (value == null) return null;
    if (_elements is EqualUnmodifiableListView) return _elements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Row(elements: $elements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowImpl &&
            const DeepCollectionEquality().equals(other._elements, _elements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_elements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RowImplCopyWith<_$RowImpl> get copyWith =>
      __$$RowImplCopyWithImpl<_$RowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RowImplToJson(
      this,
    );
  }
}

abstract class _Row implements Row {
  const factory _Row(
      {@JsonKey(name: 'elements') final List<Element>? elements}) = _$RowImpl;

  factory _Row.fromJson(Map<String, dynamic> json) = _$RowImpl.fromJson;

  @override
  @JsonKey(name: 'elements')
  List<Element>? get elements;
  @override
  @JsonKey(ignore: true)
  _$$RowImplCopyWith<_$RowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Element _$ElementFromJson(Map<String, dynamic> json) {
  return _Element.fromJson(json);
}

/// @nodoc
mixin _$Element {
  @JsonKey(name: 'distance')
  Distance? get distance => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  Duration? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElementCopyWith<Element> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementCopyWith<$Res> {
  factory $ElementCopyWith(Element value, $Res Function(Element) then) =
      _$ElementCopyWithImpl<$Res, Element>;
  @useResult
  $Res call(
      {@JsonKey(name: 'distance') Distance? distance,
      @JsonKey(name: 'duration') Duration? duration,
      @JsonKey(name: 'status') String? status});

  $DistanceCopyWith<$Res>? get distance;
  $DurationCopyWith<$Res>? get duration;
}

/// @nodoc
class _$ElementCopyWithImpl<$Res, $Val extends Element>
    implements $ElementCopyWith<$Res> {
  _$ElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? duration = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DistanceCopyWith<$Res>? get distance {
    if (_value.distance == null) {
      return null;
    }

    return $DistanceCopyWith<$Res>(_value.distance!, (value) {
      return _then(_value.copyWith(distance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationCopyWith<$Res>? get duration {
    if (_value.duration == null) {
      return null;
    }

    return $DurationCopyWith<$Res>(_value.duration!, (value) {
      return _then(_value.copyWith(duration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ElementImplCopyWith<$Res> implements $ElementCopyWith<$Res> {
  factory _$$ElementImplCopyWith(
          _$ElementImpl value, $Res Function(_$ElementImpl) then) =
      __$$ElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'distance') Distance? distance,
      @JsonKey(name: 'duration') Duration? duration,
      @JsonKey(name: 'status') String? status});

  @override
  $DistanceCopyWith<$Res>? get distance;
  @override
  $DurationCopyWith<$Res>? get duration;
}

/// @nodoc
class __$$ElementImplCopyWithImpl<$Res>
    extends _$ElementCopyWithImpl<$Res, _$ElementImpl>
    implements _$$ElementImplCopyWith<$Res> {
  __$$ElementImplCopyWithImpl(
      _$ElementImpl _value, $Res Function(_$ElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? duration = freezed,
    Object? status = freezed,
  }) {
    return _then(_$ElementImpl(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElementImpl implements _Element {
  const _$ElementImpl(
      {@JsonKey(name: 'distance') this.distance,
      @JsonKey(name: 'duration') this.duration,
      @JsonKey(name: 'status') this.status});

  factory _$ElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElementImplFromJson(json);

  @override
  @JsonKey(name: 'distance')
  final Distance? distance;
  @override
  @JsonKey(name: 'duration')
  final Duration? duration;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'Element(distance: $distance, duration: $duration, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, duration, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElementImplCopyWith<_$ElementImpl> get copyWith =>
      __$$ElementImplCopyWithImpl<_$ElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElementImplToJson(
      this,
    );
  }
}

abstract class _Element implements Element {
  const factory _Element(
      {@JsonKey(name: 'distance') final Distance? distance,
      @JsonKey(name: 'duration') final Duration? duration,
      @JsonKey(name: 'status') final String? status}) = _$ElementImpl;

  factory _Element.fromJson(Map<String, dynamic> json) = _$ElementImpl.fromJson;

  @override
  @JsonKey(name: 'distance')
  Distance? get distance;
  @override
  @JsonKey(name: 'duration')
  Duration? get duration;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$ElementImplCopyWith<_$ElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Distance _$DistanceFromJson(Map<String, dynamic> json) {
  return _Distance.fromJson(json);
}

/// @nodoc
mixin _$Distance {
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  int? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistanceCopyWith<Distance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceCopyWith<$Res> {
  factory $DistanceCopyWith(Distance value, $Res Function(Distance) then) =
      _$DistanceCopyWithImpl<$Res, Distance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'text') String? text,
      @JsonKey(name: 'value') int? value});
}

/// @nodoc
class _$DistanceCopyWithImpl<$Res, $Val extends Distance>
    implements $DistanceCopyWith<$Res> {
  _$DistanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistanceImplCopyWith<$Res>
    implements $DistanceCopyWith<$Res> {
  factory _$$DistanceImplCopyWith(
          _$DistanceImpl value, $Res Function(_$DistanceImpl) then) =
      __$$DistanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'text') String? text,
      @JsonKey(name: 'value') int? value});
}

/// @nodoc
class __$$DistanceImplCopyWithImpl<$Res>
    extends _$DistanceCopyWithImpl<$Res, _$DistanceImpl>
    implements _$$DistanceImplCopyWith<$Res> {
  __$$DistanceImplCopyWithImpl(
      _$DistanceImpl _value, $Res Function(_$DistanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? value = freezed,
  }) {
    return _then(_$DistanceImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistanceImpl implements _Distance {
  const _$DistanceImpl(
      {@JsonKey(name: 'text') this.text, @JsonKey(name: 'value') this.value});

  factory _$DistanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistanceImplFromJson(json);

  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'value')
  final int? value;

  @override
  String toString() {
    return 'Distance(text: $text, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistanceImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DistanceImplCopyWith<_$DistanceImpl> get copyWith =>
      __$$DistanceImplCopyWithImpl<_$DistanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistanceImplToJson(
      this,
    );
  }
}

abstract class _Distance implements Distance {
  const factory _Distance(
      {@JsonKey(name: 'text') final String? text,
      @JsonKey(name: 'value') final int? value}) = _$DistanceImpl;

  factory _Distance.fromJson(Map<String, dynamic> json) =
      _$DistanceImpl.fromJson;

  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'value')
  int? get value;
  @override
  @JsonKey(ignore: true)
  _$$DistanceImplCopyWith<_$DistanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Duration _$DurationFromJson(Map<String, dynamic> json) {
  return _Duration.fromJson(json);
}

/// @nodoc
mixin _$Duration {
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  int? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationCopyWith<Duration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationCopyWith<$Res> {
  factory $DurationCopyWith(Duration value, $Res Function(Duration) then) =
      _$DurationCopyWithImpl<$Res, Duration>;
  @useResult
  $Res call(
      {@JsonKey(name: 'text') String? text,
      @JsonKey(name: 'value') int? value});
}

/// @nodoc
class _$DurationCopyWithImpl<$Res, $Val extends Duration>
    implements $DurationCopyWith<$Res> {
  _$DurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DurationImplCopyWith<$Res>
    implements $DurationCopyWith<$Res> {
  factory _$$DurationImplCopyWith(
          _$DurationImpl value, $Res Function(_$DurationImpl) then) =
      __$$DurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'text') String? text,
      @JsonKey(name: 'value') int? value});
}

/// @nodoc
class __$$DurationImplCopyWithImpl<$Res>
    extends _$DurationCopyWithImpl<$Res, _$DurationImpl>
    implements _$$DurationImplCopyWith<$Res> {
  __$$DurationImplCopyWithImpl(
      _$DurationImpl _value, $Res Function(_$DurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? value = freezed,
  }) {
    return _then(_$DurationImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DurationImpl implements _Duration {
  const _$DurationImpl(
      {@JsonKey(name: 'text') this.text, @JsonKey(name: 'value') this.value});

  factory _$DurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DurationImplFromJson(json);

  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'value')
  final int? value;

  @override
  String toString() {
    return 'Duration(text: $text, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DurationImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DurationImplCopyWith<_$DurationImpl> get copyWith =>
      __$$DurationImplCopyWithImpl<_$DurationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationImplToJson(
      this,
    );
  }
}

abstract class _Duration implements Duration {
  const factory _Duration(
      {@JsonKey(name: 'text') final String? text,
      @JsonKey(name: 'value') final int? value}) = _$DurationImpl;

  factory _Duration.fromJson(Map<String, dynamic> json) =
      _$DurationImpl.fromJson;

  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'value')
  int? get value;
  @override
  @JsonKey(ignore: true)
  _$$DurationImplCopyWith<_$DurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
