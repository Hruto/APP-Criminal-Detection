import 'package:dio/dio.dart';
import '../domain/cameras_repo.dart';
import '../domain/camera.dart';

class CamerasRepoApi implements CamerasRepo {
  final Dio _dio;
  CamerasRepoApi(this._dio);

  @override
  Future<List<Camera>> listCameras() async {
    final res = await _dio.get('/api/cameras');
    final body = res.data;
    final List<dynamic> list;
    if (body is List) {
      list = body;
    } else if (body is Map && body['items'] is List) {
      list = body['items'] as List;
    } else {
      throw Exception('Unexpected response for /api/cameras');
    }
    return list.map((e) => _mapCamera((e as Map).cast<String, dynamic>())).toList();
  }

  @override
  Future<Camera> getCamera(String id) async {
    // The spec doesn’t list GET /api/cameras/{id}; fallback to list + find
    try {
      final res = await _dio.get('/api/cameras/$id');
      final m = (res.data as Map).cast<String, dynamic>();
      return _mapCamera(m);
    } on DioException {
      final all = await listCameras();
      final cam = all.firstWhere(
        (c) => c.id == id,
        orElse: () => throw Exception('Camera $id not found'),
      );
      return cam;
    }
  }

  Camera _mapCamera(Map<String, dynamic> m) {
    // Accept different shapes: id or camera_id, etc.
    final rawId = m['id'] ?? m['camera_id'] ?? m['cameraId'] ?? m['uuid'];
    final id = rawId?.toString() ?? '';
    final name = (m['name'] ?? m['title'] ?? 'Camera $id').toString();
    final location = (m['location'] ?? m['site'] ?? m['area'])?.toString();
    final online = (m['online'] is bool) ? m['online'] as bool : false;
    final activeAlerts = (m['activeAlerts'] is num) ? (m['activeAlerts'] as num).toInt() : 0;
    final streamUrl = (m['stream_url'] ?? m['streamUrl'])?.toString();
    return Camera(
      id: id,
      name: name,
      location: location,
      online: online,
      activeAlerts: activeAlerts,
      streamUrl: streamUrl,
    );
  }
}

