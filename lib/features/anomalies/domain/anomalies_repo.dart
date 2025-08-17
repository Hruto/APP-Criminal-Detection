import 'anomaly.dart';

abstract class AnomaliesRepo {
  Future<List<Anomaly>> list({String? cameraId});
  Future<Anomaly> getById(String id);
}
