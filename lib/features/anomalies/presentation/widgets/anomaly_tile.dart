import 'package:anomeye/features/anomalies/domain/anomaly.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnomalyTile extends StatelessWidget {
  final Anomaly anomaly;
  const AnomalyTile({super.key, required this.anomaly});

  @override
  Widget build(BuildContext context) {
    final dt = DateFormat('yyyy-MM-dd HH:mm').format(anomaly.time);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.warning_amber_rounded),
      ),
      title: Text(anomaly.label),
      subtitle: Text(dt),
      trailing: Text('${(anomaly.score * 100).toStringAsFixed(0)}%'),
    );
  }
}
