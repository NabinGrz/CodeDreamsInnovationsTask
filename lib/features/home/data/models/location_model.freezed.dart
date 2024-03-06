// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  List<AddressComponent>? get address_components =>
      throw _privateConstructorUsedError;
  String? get formatted_address => throw _privateConstructorUsedError;
  Geometry? get geometry => throw _privateConstructorUsedError;
  String? get place_id => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call(
      {List<AddressComponent>? address_components,
      String? formatted_address,
      Geometry? geometry,
      String? place_id,
      List<String>? types});

  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address_components = freezed,
    Object? formatted_address = freezed,
    Object? geometry = freezed,
    Object? place_id = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      address_components: freezed == address_components
          ? _value.address_components
          : address_components // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>?,
      formatted_address: freezed == formatted_address
          ? _value.formatted_address
          : formatted_address // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      place_id: freezed == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GeometryCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AddressComponent>? address_components,
      String? formatted_address,
      Geometry? geometry,
      String? place_id,
      List<String>? types});

  @override
  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address_components = freezed,
    Object? formatted_address = freezed,
    Object? geometry = freezed,
    Object? place_id = freezed,
    Object? types = freezed,
  }) {
    return _then(_$LocationModelImpl(
      address_components: freezed == address_components
          ? _value._address_components
          : address_components // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>?,
      formatted_address: freezed == formatted_address
          ? _value.formatted_address
          : formatted_address // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      place_id: freezed == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl implements _LocationModel {
  const _$LocationModelImpl(
      {final List<AddressComponent>? address_components,
      this.formatted_address,
      this.geometry,
      this.place_id,
      final List<String>? types})
      : _address_components = address_components,
        _types = types;

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  final List<AddressComponent>? _address_components;
  @override
  List<AddressComponent>? get address_components {
    final value = _address_components;
    if (value == null) return null;
    if (_address_components is EqualUnmodifiableListView)
      return _address_components;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? formatted_address;
  @override
  final Geometry? geometry;
  @override
  final String? place_id;
  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LocationModel(address_components: $address_components, formatted_address: $formatted_address, geometry: $geometry, place_id: $place_id, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            const DeepCollectionEquality()
                .equals(other._address_components, _address_components) &&
            (identical(other.formatted_address, formatted_address) ||
                other.formatted_address == formatted_address) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.place_id, place_id) ||
                other.place_id == place_id) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_address_components),
      formatted_address,
      geometry,
      place_id,
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel(
      {final List<AddressComponent>? address_components,
      final String? formatted_address,
      final Geometry? geometry,
      final String? place_id,
      final List<String>? types}) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  List<AddressComponent>? get address_components;
  @override
  String? get formatted_address;
  @override
  Geometry? get geometry;
  @override
  String? get place_id;
  @override
  List<String>? get types;
  @override
  @JsonKey(ignore: true)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressComponent _$AddressComponentFromJson(Map<String, dynamic> json) {
  return _AddressComponent.fromJson(json);
}

/// @nodoc
mixin _$AddressComponent {
  String? get long_name => throw _privateConstructorUsedError;
  String? get short_name => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressComponentCopyWith<AddressComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressComponentCopyWith<$Res> {
  factory $AddressComponentCopyWith(
          AddressComponent value, $Res Function(AddressComponent) then) =
      _$AddressComponentCopyWithImpl<$Res, AddressComponent>;
  @useResult
  $Res call({String? long_name, String? short_name, List<String>? types});
}

/// @nodoc
class _$AddressComponentCopyWithImpl<$Res, $Val extends AddressComponent>
    implements $AddressComponentCopyWith<$Res> {
  _$AddressComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? long_name = freezed,
    Object? short_name = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      long_name: freezed == long_name
          ? _value.long_name
          : long_name // ignore: cast_nullable_to_non_nullable
              as String?,
      short_name: freezed == short_name
          ? _value.short_name
          : short_name // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressComponentImplCopyWith<$Res>
    implements $AddressComponentCopyWith<$Res> {
  factory _$$AddressComponentImplCopyWith(_$AddressComponentImpl value,
          $Res Function(_$AddressComponentImpl) then) =
      __$$AddressComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? long_name, String? short_name, List<String>? types});
}

/// @nodoc
class __$$AddressComponentImplCopyWithImpl<$Res>
    extends _$AddressComponentCopyWithImpl<$Res, _$AddressComponentImpl>
    implements _$$AddressComponentImplCopyWith<$Res> {
  __$$AddressComponentImplCopyWithImpl(_$AddressComponentImpl _value,
      $Res Function(_$AddressComponentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? long_name = freezed,
    Object? short_name = freezed,
    Object? types = freezed,
  }) {
    return _then(_$AddressComponentImpl(
      long_name: freezed == long_name
          ? _value.long_name
          : long_name // ignore: cast_nullable_to_non_nullable
              as String?,
      short_name: freezed == short_name
          ? _value.short_name
          : short_name // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressComponentImpl implements _AddressComponent {
  const _$AddressComponentImpl(
      {this.long_name, this.short_name, final List<String>? types})
      : _types = types;

  factory _$AddressComponentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressComponentImplFromJson(json);

  @override
  final String? long_name;
  @override
  final String? short_name;
  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AddressComponent(long_name: $long_name, short_name: $short_name, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressComponentImpl &&
            (identical(other.long_name, long_name) ||
                other.long_name == long_name) &&
            (identical(other.short_name, short_name) ||
                other.short_name == short_name) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, long_name, short_name,
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressComponentImplCopyWith<_$AddressComponentImpl> get copyWith =>
      __$$AddressComponentImplCopyWithImpl<_$AddressComponentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressComponentImplToJson(
      this,
    );
  }
}

abstract class _AddressComponent implements AddressComponent {
  const factory _AddressComponent(
      {final String? long_name,
      final String? short_name,
      final List<String>? types}) = _$AddressComponentImpl;

  factory _AddressComponent.fromJson(Map<String, dynamic> json) =
      _$AddressComponentImpl.fromJson;

  @override
  String? get long_name;
  @override
  String? get short_name;
  @override
  List<String>? get types;
  @override
  @JsonKey(ignore: true)
  _$$AddressComponentImplCopyWith<_$AddressComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return _Geometry.fromJson(json);
}

/// @nodoc
mixin _$Geometry {
  Location? get location => throw _privateConstructorUsedError;
  String? get location_type => throw _privateConstructorUsedError;
  Viewport? get viewport => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeometryCopyWith<Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeometryCopyWith<$Res> {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) then) =
      _$GeometryCopyWithImpl<$Res, Geometry>;
  @useResult
  $Res call({Location? location, String? location_type, Viewport? viewport});

  $LocationCopyWith<$Res>? get location;
  $ViewportCopyWith<$Res>? get viewport;
}

/// @nodoc
class _$GeometryCopyWithImpl<$Res, $Val extends Geometry>
    implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? location_type = freezed,
    Object? viewport = freezed,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      location_type: freezed == location_type
          ? _value.location_type
          : location_type // ignore: cast_nullable_to_non_nullable
              as String?,
      viewport: freezed == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Viewport?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewportCopyWith<$Res>? get viewport {
    if (_value.viewport == null) {
      return null;
    }

    return $ViewportCopyWith<$Res>(_value.viewport!, (value) {
      return _then(_value.copyWith(viewport: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeometryImplCopyWith<$Res>
    implements $GeometryCopyWith<$Res> {
  factory _$$GeometryImplCopyWith(
          _$GeometryImpl value, $Res Function(_$GeometryImpl) then) =
      __$$GeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Location? location, String? location_type, Viewport? viewport});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $ViewportCopyWith<$Res>? get viewport;
}

/// @nodoc
class __$$GeometryImplCopyWithImpl<$Res>
    extends _$GeometryCopyWithImpl<$Res, _$GeometryImpl>
    implements _$$GeometryImplCopyWith<$Res> {
  __$$GeometryImplCopyWithImpl(
      _$GeometryImpl _value, $Res Function(_$GeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? location_type = freezed,
    Object? viewport = freezed,
  }) {
    return _then(_$GeometryImpl(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      location_type: freezed == location_type
          ? _value.location_type
          : location_type // ignore: cast_nullable_to_non_nullable
              as String?,
      viewport: freezed == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Viewport?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeometryImpl implements _Geometry {
  const _$GeometryImpl({this.location, this.location_type, this.viewport});

  factory _$GeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeometryImplFromJson(json);

  @override
  final Location? location;
  @override
  final String? location_type;
  @override
  final Viewport? viewport;

  @override
  String toString() {
    return 'Geometry(location: $location, location_type: $location_type, viewport: $viewport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeometryImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.location_type, location_type) ||
                other.location_type == location_type) &&
            (identical(other.viewport, viewport) ||
                other.viewport == viewport));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, location, location_type, viewport);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeometryImplCopyWith<_$GeometryImpl> get copyWith =>
      __$$GeometryImplCopyWithImpl<_$GeometryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeometryImplToJson(
      this,
    );
  }
}

abstract class _Geometry implements Geometry {
  const factory _Geometry(
      {final Location? location,
      final String? location_type,
      final Viewport? viewport}) = _$GeometryImpl;

  factory _Geometry.fromJson(Map<String, dynamic> json) =
      _$GeometryImpl.fromJson;

  @override
  Location? get location;
  @override
  String? get location_type;
  @override
  Viewport? get viewport;
  @override
  @JsonKey(ignore: true)
  _$$GeometryImplCopyWith<_$GeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({double? lat, double? lng});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? lat, double? lng});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$LocationImpl(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl({this.lat, this.lng});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final double? lat;
  @override
  final double? lng;

  @override
  String toString() {
    return 'Location(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location({final double? lat, final double? lng}) =
      _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  double? get lat;
  @override
  double? get lng;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Viewport _$ViewportFromJson(Map<String, dynamic> json) {
  return _Viewport.fromJson(json);
}

/// @nodoc
mixin _$Viewport {
  Location? get northeast => throw _privateConstructorUsedError;
  Location? get southwest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewportCopyWith<Viewport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewportCopyWith<$Res> {
  factory $ViewportCopyWith(Viewport value, $Res Function(Viewport) then) =
      _$ViewportCopyWithImpl<$Res, Viewport>;
  @useResult
  $Res call({Location? northeast, Location? southwest});

  $LocationCopyWith<$Res>? get northeast;
  $LocationCopyWith<$Res>? get southwest;
}

/// @nodoc
class _$ViewportCopyWithImpl<$Res, $Val extends Viewport>
    implements $ViewportCopyWith<$Res> {
  _$ViewportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_value.copyWith(
      northeast: freezed == northeast
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as Location?,
      southwest: freezed == southwest
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as Location?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get northeast {
    if (_value.northeast == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.northeast!, (value) {
      return _then(_value.copyWith(northeast: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get southwest {
    if (_value.southwest == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.southwest!, (value) {
      return _then(_value.copyWith(southwest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewportImplCopyWith<$Res>
    implements $ViewportCopyWith<$Res> {
  factory _$$ViewportImplCopyWith(
          _$ViewportImpl value, $Res Function(_$ViewportImpl) then) =
      __$$ViewportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Location? northeast, Location? southwest});

  @override
  $LocationCopyWith<$Res>? get northeast;
  @override
  $LocationCopyWith<$Res>? get southwest;
}

/// @nodoc
class __$$ViewportImplCopyWithImpl<$Res>
    extends _$ViewportCopyWithImpl<$Res, _$ViewportImpl>
    implements _$$ViewportImplCopyWith<$Res> {
  __$$ViewportImplCopyWithImpl(
      _$ViewportImpl _value, $Res Function(_$ViewportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_$ViewportImpl(
      northeast: freezed == northeast
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as Location?,
      southwest: freezed == southwest
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as Location?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewportImpl implements _Viewport {
  const _$ViewportImpl({this.northeast, this.southwest});

  factory _$ViewportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewportImplFromJson(json);

  @override
  final Location? northeast;
  @override
  final Location? southwest;

  @override
  String toString() {
    return 'Viewport(northeast: $northeast, southwest: $southwest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewportImpl &&
            (identical(other.northeast, northeast) ||
                other.northeast == northeast) &&
            (identical(other.southwest, southwest) ||
                other.southwest == southwest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, northeast, southwest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewportImplCopyWith<_$ViewportImpl> get copyWith =>
      __$$ViewportImplCopyWithImpl<_$ViewportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewportImplToJson(
      this,
    );
  }
}

abstract class _Viewport implements Viewport {
  const factory _Viewport(
      {final Location? northeast, final Location? southwest}) = _$ViewportImpl;

  factory _Viewport.fromJson(Map<String, dynamic> json) =
      _$ViewportImpl.fromJson;

  @override
  Location? get northeast;
  @override
  Location? get southwest;
  @override
  @JsonKey(ignore: true)
  _$$ViewportImplCopyWith<_$ViewportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
