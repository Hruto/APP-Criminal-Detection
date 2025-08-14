class Camera {
  final String id;
  final String name;
  final String location;
  final String streamUrl;
  final bool online;
  final int activeAlerts;

  const Camera({
    required this.id,
    required this.name,
    required this.location,
    required this.streamUrl,
    required this.online,
    required this.activeAlerts,
  });
}
