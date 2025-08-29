import 'package:dio/dio.dart';
import 'package:anomeye/features/cameras/domain/cameras_repo.dart';
import 'package:anomeye/features/cameras/domain/camera.dart';

/// Implementasi “real API”. Belum diisi, hanya bentuknya.
class CamerasRepoApi implements CamerasRepo {
  final Dio _dio;
  CamerasRepoApi(this._dio);

  @override
  Future<List<Camera>> listCameras() async {
    // final res = await _dio.get('/api/cameras');
    // final data = (res.data as List).cast<Map<String, dynamic>>();
    // return data.map(Camera.fromJson).toList();
    throw UnimplementedError('listCameras() belum diimplementasikan');
  }

  @override
  Future<Camera> getCamera(String id) async {
    // final res = await _dio.get('/api/cameras/$id');
    // return Camera.fromJson(res.data as Map<String, dynamic>);
    throw UnimplementedError('getCamera() belum diimplementasikan');
  }
}
