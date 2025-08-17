import 'package:dio/dio.dart';
import '../domain/anomaly.dart';

class AnomaliesApi {
  final Dio _dio;
  AnomaliesApi(this._dio);

  Future<List<Anomaly>> list({String? cameraId}) async {
    // TODO: ganti endpoint, contoh:
    // final r = await _dio.get('/api/anomalies', queryParameters: { if (cameraId != null) 'camera_id': cameraId });
    // return (r.data as List).map((e) => Anomaly.fromJson(e)).toList();

    // dummy aman:
    return [
      Anomaly(
        id: 'A1',
        cameraId: cameraId ?? 'cam1',
        time: DateTime.now().subtract(const Duration(minutes: 8)),
        label: 'Intrusion',
        score: 0.91,
      ),
      Anomaly(
        id: 'A2',
        cameraId: cameraId ?? 'cam1',
        time: DateTime.now().subtract(const Duration(hours: 1, minutes: 12)),
        label: 'Loitering',
        score: 0.72,
      ),
    ];
  }

  Future<Anomaly> getById(String id) async {
    final all = await list();
    return all.firstWhere((a) => a.id == id);
  }
}
