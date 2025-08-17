// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anomaly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnomalyImpl _$$AnomalyImplFromJson(Map<String, dynamic> json) =>
    _$AnomalyImpl(
      id: json['id'] as String,
      cameraId: json['cameraId'] as String,
      time: DateTime.parse(json['time'] as String),
      label: json['label'] as String,
      score: (json['score'] as num).toDouble(),
      clipUrl: json['clipUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$$AnomalyImplToJson(_$AnomalyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cameraId': instance.cameraId,
      'time': instance.time.toIso8601String(),
      'label': instance.label,
      'score': instance.score,
      'clipUrl': instance.clipUrl,
      'thumbnailUrl': instance.thumbnailUrl,
    };
