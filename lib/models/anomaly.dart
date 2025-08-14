class Anomaly {
  final String id;
  final String cameraId;
  final DateTime time;
  final String label;
  final double score;
  final String thumbnailUrl;

  const Anomaly({
    required this.id,
    required this.cameraId,
    required this.time,
    required this.label,
    required this.score,
    required this.thumbnailUrl,
  });
}
