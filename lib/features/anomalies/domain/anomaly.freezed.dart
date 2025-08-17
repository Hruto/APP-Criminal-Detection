// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anomaly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Anomaly _$AnomalyFromJson(Map<String, dynamic> json) {
  return _Anomaly.fromJson(json);
}

/// @nodoc
mixin _$Anomaly {
  String get id => throw _privateConstructorUsedError;
  String get cameraId => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String? get clipUrl =>
      throw _privateConstructorUsedError; // evidence video (presigned)
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// Serializes this Anomaly to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Anomaly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnomalyCopyWith<Anomaly> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnomalyCopyWith<$Res> {
  factory $AnomalyCopyWith(Anomaly value, $Res Function(Anomaly) then) =
      _$AnomalyCopyWithImpl<$Res, Anomaly>;
  @useResult
  $Res call(
      {String id,
      String cameraId,
      DateTime time,
      String label,
      double score,
      String? clipUrl,
      String? thumbnailUrl});
}

/// @nodoc
class _$AnomalyCopyWithImpl<$Res, $Val extends Anomaly>
    implements $AnomalyCopyWith<$Res> {
  _$AnomalyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Anomaly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cameraId = null,
    Object? time = null,
    Object? label = null,
    Object? score = null,
    Object? clipUrl = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cameraId: null == cameraId
          ? _value.cameraId
          : cameraId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      clipUrl: freezed == clipUrl
          ? _value.clipUrl
          : clipUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnomalyImplCopyWith<$Res> implements $AnomalyCopyWith<$Res> {
  factory _$$AnomalyImplCopyWith(
          _$AnomalyImpl value, $Res Function(_$AnomalyImpl) then) =
      __$$AnomalyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String cameraId,
      DateTime time,
      String label,
      double score,
      String? clipUrl,
      String? thumbnailUrl});
}

/// @nodoc
class __$$AnomalyImplCopyWithImpl<$Res>
    extends _$AnomalyCopyWithImpl<$Res, _$AnomalyImpl>
    implements _$$AnomalyImplCopyWith<$Res> {
  __$$AnomalyImplCopyWithImpl(
      _$AnomalyImpl _value, $Res Function(_$AnomalyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Anomaly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cameraId = null,
    Object? time = null,
    Object? label = null,
    Object? score = null,
    Object? clipUrl = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_$AnomalyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cameraId: null == cameraId
          ? _value.cameraId
          : cameraId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      clipUrl: freezed == clipUrl
          ? _value.clipUrl
          : clipUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnomalyImpl implements _Anomaly {
  const _$AnomalyImpl(
      {required this.id,
      required this.cameraId,
      required this.time,
      required this.label,
      required this.score,
      this.clipUrl,
      this.thumbnailUrl});

  factory _$AnomalyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnomalyImplFromJson(json);

  @override
  final String id;
  @override
  final String cameraId;
  @override
  final DateTime time;
  @override
  final String label;
  @override
  final double score;
  @override
  final String? clipUrl;
// evidence video (presigned)
  @override
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'Anomaly(id: $id, cameraId: $cameraId, time: $time, label: $label, score: $score, clipUrl: $clipUrl, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnomalyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cameraId, cameraId) ||
                other.cameraId == cameraId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.clipUrl, clipUrl) || other.clipUrl == clipUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, cameraId, time, label, score, clipUrl, thumbnailUrl);

  /// Create a copy of Anomaly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnomalyImplCopyWith<_$AnomalyImpl> get copyWith =>
      __$$AnomalyImplCopyWithImpl<_$AnomalyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnomalyImplToJson(
      this,
    );
  }
}

abstract class _Anomaly implements Anomaly {
  const factory _Anomaly(
      {required final String id,
      required final String cameraId,
      required final DateTime time,
      required final String label,
      required final double score,
      final String? clipUrl,
      final String? thumbnailUrl}) = _$AnomalyImpl;

  factory _Anomaly.fromJson(Map<String, dynamic> json) = _$AnomalyImpl.fromJson;

  @override
  String get id;
  @override
  String get cameraId;
  @override
  DateTime get time;
  @override
  String get label;
  @override
  double get score;
  @override
  String? get clipUrl; // evidence video (presigned)
  @override
  String? get thumbnailUrl;

  /// Create a copy of Anomaly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnomalyImplCopyWith<_$AnomalyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
