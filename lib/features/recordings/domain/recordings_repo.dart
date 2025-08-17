import 'recording.dart';

abstract class RecordingsRepo {
  Future<List<Recording>> list({
    required String cameraId,
    DateTime? from,
    DateTime? to,
    bool presign = true,
  });
}
