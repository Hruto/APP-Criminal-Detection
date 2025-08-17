import 'package:anomeye/features/cameras/presentation/screens/cameras_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraDetailScreen extends ConsumerWidget {
  final String cameraId;
  const CameraDetailScreen({super.key, required this.cameraId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameras = ref.watch(camerasListProvider);
    final camera = cameras.value?.firstWhere((c) => c.id == cameraId);

    return Scaffold(
      appBar: AppBar(title: Text(camera?.name ?? 'Camera Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.play_circle_outline,
                    size: 64, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            Text(camera?.location ?? 'No location',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(
                    label:
                        Text(camera?.online ?? false ? 'Online' : 'Offline')),
                const SizedBox(width: 8),
                Chip(label: Text('Alerts: ${camera?.activeAlerts}')),
              ],
            ),
            const SizedBox(height: 16),
            Text('Stream URL', style: Theme.of(context).textTheme.titleSmall),
            SelectableText(camera?.streamUrl ?? 'No stream URL'),
          ],
        ),
      ),
    );
  }
}
