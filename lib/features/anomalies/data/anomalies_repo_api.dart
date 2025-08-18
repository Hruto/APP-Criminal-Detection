import 'package:anomeye/features/anomalies/domain/anomalies_repo.dart';
import 'package:anomeye/features/anomalies/domain/anomaly.dart';
import 'package:dio/dio.dart';

/// Implementasi “real API”. Masih skeleton.
class AnomaliesRepoApi implements AnomaliesRepo {
  final Dio _dio;
  AnomaliesRepoApi(this._dio);

  @override
  Future<List<Anomaly>> listRecent({String? cameraId, int limit = 50}) async {
    // final res = await _dio.get(
    //   '/api/anomalies',
    //   queryParameters: {
    //     if (cameraId != null) 'camera_id': cameraId,
    //     'limit': limit,
    //   },
    // );
    // final items = (res.data as List).cast<Map<String, dynamic>>();
    // return items.map(Anomaly.fromJson).toList();
    throw UnimplementedError('listRecent belum diimplementasikan');
  }

  @override
  Future<Anomaly> getById(String id) async {
    // final res = await _dio.get('/api/anomalies/$id');
    // return Anomaly.fromJson(res.data as Map<String, dynamic>);
    throw UnimplementedError('getById belum diimplementasikan');
  }
}
