import 'package:freezed_annotation/freezed_annotation.dart';
part 'camera.freezed.dart';
part 'camera.g.dart';

@freezed
class Camera with _$Camera {
  const factory Camera({
    required String id,
    required String name,
    String? location,
    bool? online,
    int? activeAlerts,
    String? streamUrl, // optional (bisa dibangun dari env + id)
  }) = _Camera;

  factory Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);
}
