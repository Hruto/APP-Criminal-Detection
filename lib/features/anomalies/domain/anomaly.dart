import 'package:freezed_annotation/freezed_annotation.dart';
part 'anomaly.freezed.dart';
part 'anomaly.g.dart';

@freezed
class Anomaly with _$Anomaly {
  const factory Anomaly({
    required String id,
    required String cameraId,
    required DateTime time,
    required String label,
    required double score,
    String? clipUrl, // evidence video (presigned)
    String? thumbnailUrl, // optional
  }) = _Anomaly;

  factory Anomaly.fromJson(Map<String, dynamic> json) =>
      _$AnomalyFromJson(json);
}
