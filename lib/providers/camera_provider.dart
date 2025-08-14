import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anomeye/models/camera.dart';
import 'package:anomeye/models/anomaly.dart';

final camerasProvider = Provider<List<Camera>>((ref) {
  // Dummy data; replace with API call
  return const [
    Camera(
      id: 'C1',
      name: 'Lobby - Cam 1',
      location: 'Main Lobby',
      streamUrl: 'https://example.com/stream/c1.m3u8',
      online: true,
      activeAlerts: 2,
    ),
    Camera(
      id: 'C2',
      name: 'Parking - Cam 2',
      location: 'Basement P2',
      streamUrl: 'https://example.com/stream/c2.m3u8',
      online: true,
      activeAlerts: 0,
    ),
    Camera(
      id: 'C3',
      name: 'Hallway - 3F',
      location: '3rd Floor',
      streamUrl: 'https://example.com/stream/c3.m3u8',
      online: false,
      activeAlerts: 0,
    ),
  ];
});

final anomaliesProvider = Provider<List<Anomaly>>((ref) {
  return [
    Anomaly(
      id: 'A1',
      cameraId: 'C1',
      time: DateTime.now().subtract(const Duration(minutes: 8)),
      label: 'Intrusion',
      score: 0.91,
      thumbnailUrl: '',
    ),
    Anomaly(
      id: 'A2',
      cameraId: 'C1',
      time: DateTime.now().subtract(const Duration(hours: 1, minutes: 12)),
      label: 'Loitering',
      score: 0.72,
      thumbnailUrl: '',
    ),
  ];
});
