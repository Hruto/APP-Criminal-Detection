import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anomeye/providers/camera_provider.dart';
import 'package:anomeye/widgets/anomaly_tile.dart';

class AnomalyHistoryScreen extends ConsumerWidget {
  const AnomalyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anomalies = ref.watch(anomaliesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Anomaly History')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: anomalies.length,
        separatorBuilder: (_, __) => const SizedBox(height: 4),
        itemBuilder: (context, i) => AnomalyTile(anomaly: anomalies[i]),
      ),
    );
  }
}
