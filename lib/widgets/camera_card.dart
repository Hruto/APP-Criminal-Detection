import 'package:flutter/material.dart';
import 'package:anomeye/models/camera.dart';

class CameraCard extends StatelessWidget {
  final Camera camera;
  final VoidCallback? onTap;
  const CameraCard({super.key, required this.camera, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    camera.online ? Icons.videocam : Icons.videocam_off,
                    size: 48,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(camera.name, style: Theme.of(context).textTheme.titleMedium),
              Text(camera.location, style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 6),
              Row(
                children: [
                  Chip(
                    label: Text(camera.online ? 'Online' : 'Offline'),
                    backgroundColor: camera.online ? Colors.green.shade50 : Colors.red.shade50,
                    side: BorderSide(color: camera.online ? Colors.green : Colors.red),
                  ),
                  const SizedBox(width: 8),
                  if (camera.activeAlerts > 0)
                    Chip(
                      label: Text('${camera.activeAlerts} alert(s)'),
                      backgroundColor: Colors.orange.shade50,
                      side: const BorderSide(color: Colors.orange),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
