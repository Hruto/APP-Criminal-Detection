import 'package:anomeye/features/anomalies/presentation/anomaly_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anomeye/features/anomalies/presentation/widgets/anomaly_tile.dart';
import 'package:anomeye/shared/widgets/app_bottom_nav_bar.dart';

class AnomalyHistoryScreen extends ConsumerStatefulWidget {
  const AnomalyHistoryScreen({super.key});

  @override
  ConsumerState<AnomalyHistoryScreen> createState() =>
      _AnomalyHistoryScreenState();
}

class _AnomalyHistoryScreenState extends ConsumerState<AnomalyHistoryScreen> {
  @override
  void initState() {
    super.initState();
    // Set the current navigation index to 1 (History) when this screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentNavIndexProvider.notifier).state = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final anomalies = ref.watch(anomaliesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF024670),
        centerTitle: true,
        title: SizedBox(
          height: 50,
          child: Image.asset(
            'assets/images/anomeye.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: anomalies.length,
        separatorBuilder: (_, __) => const SizedBox(height: 4),
        itemBuilder: (context, i) => AnomalyTile(anomaly: anomalies[i]),
      ),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
