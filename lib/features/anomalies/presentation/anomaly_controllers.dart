import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anomeye/features/anomalies/domain/anomaly.dart';

/// Dummy list untuk pengembangan UI.
/// Ganti nanti dengan FutureProvider dari repository/API.
final anomaliesProvider = Provider<List<Anomaly>>((ref) {
  final now = DateTime.now();
  return [
    Anomaly(
      id: 'A1',
      cameraId: 'C1',
      time: now.subtract(const Duration(minutes: 8)),
      label: 'Intrusion',
      score: 0.91,
      thumbnailUrl: '', // isi jika punya
    ),
    Anomaly(
      id: 'A2',
      cameraId: 'C1',
      time: now.subtract(const Duration(hours: 1, minutes: 12)),
      label: 'Loitering',
      score: 0.72,
      thumbnailUrl: '',
    ),
    Anomaly(
      id: 'A3',
      cameraId: 'C2',
      time: now.subtract(const Duration(days: 1, minutes: 5)),
      label: 'Suspicious Object',
      score: 0.81,
      thumbnailUrl: '',
    ),
  ];
});
