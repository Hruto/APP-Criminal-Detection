import '../domain/anomalies_repo.dart';
import '../domain/anomaly.dart';
import 'anomalies_api.dart';

class AnomaliesRepoImpl implements AnomaliesRepo {
  final AnomaliesApi api;
  AnomaliesRepoImpl(this.api);

  @override
  Future<List<Anomaly>> list({String? cameraId}) =>
      api.list(cameraId: cameraId);

  @override
  Future<Anomaly> getById(String id) => api.getById(id);
}
