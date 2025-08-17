import 'package:dio/dio.dart';
import '../domain/camera.dart';

class CamerasApi {
  final Dio _dio;
  CamerasApi(this._dio);

  Future<List<Camera>> list() async {
    // TODO: ganti endpoint
    // final r = await _dio.get('/api/cameras');
    // return (r.data as List).map((e) => Camera.fromJson(e)).toList();

    // dummy aman:
    return const [
      Camera(
          id: 'cam1',
          name: 'Lobby - Cam 1',
          location: 'Main Lobby',
          online: true,
          activeAlerts: 2),
      Camera(
          id: 'cam2',
          name: 'Parking - Cam 2',
          location: 'Basement',
          online: true,
          activeAlerts: 0),
    ];
  }

  Future<Camera> getById(String id) async {
    final all = await list();
    return all.firstWhere((c) => c.id == id);
  }
}
