import 'package:anomeye/features/anomalies/presentation/anomaly_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AnomalyDetailScreen extends ConsumerWidget {
  final String anomalyId;
  const AnomalyDetailScreen({super.key, required this.anomalyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anomalies = ref.watch(anomaliesProvider);
    final anomaly = anomalies.firstWhere((a) => a.id == anomalyId);

    return Scaffold(
      appBar: AppBar(
        title: Text(anomaly.label),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail/Video container
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: anomaly.thumbnailUrl != null &&
                        anomaly.thumbnailUrl!.isNotEmpty
                    ? Image.network(anomaly.thumbnailUrl!)
                    : const Icon(Icons.warning_amber_rounded,
                        size: 64, color: Colors.amber),
              ),
            ),
            const SizedBox(height: 16),

            // Anomaly details
            Text('Anomaly Details',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),

            _buildDetailRow(context, 'Type', anomaly.label),
            _buildDetailRow(context, 'Time',
                DateFormat('yyyy-MM-dd HH:mm').format(anomaly.time)),
            _buildDetailRow(context, 'Confidence',
                '${(anomaly.score * 100).toStringAsFixed(0)}%'),
            _buildDetailRow(context, 'Camera ID', anomaly.cameraId),

            const SizedBox(height: 16),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  context,
                  Icons.videocam_outlined,
                  'View Clip',
                  anomaly.clipUrl != null && anomaly.clipUrl!.isNotEmpty,
                  () {
                    // Navigate to video player or show message if no clip
                    if (anomaly.clipUrl != null &&
                        anomaly.clipUrl!.isNotEmpty) {
                      // Navigate to video player
                      // context.push('/clip/${anomaly.id}');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Video player not implemented yet')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('No video clip available')));
                    }
                  },
                ),
                _buildActionButton(
                  context,
                  Icons.camera_alt_outlined,
                  'View Camera',
                  true,
                  () => Navigator.pushNamed(
                      context, '/camera/${anomaly.cameraId}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label,
      bool enabled, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF024670),
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey.shade300,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
