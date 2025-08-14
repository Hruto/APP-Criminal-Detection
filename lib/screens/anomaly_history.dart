import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';              
import 'package:anomeye/providers/camera_provider.dart';
import 'package:anomeye/widgets/anomaly_tile.dart';
import 'package:anomeye/providers/auth_provider.dart';

class AnomalyHistoryScreen extends ConsumerWidget {
  const AnomalyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anomalies = ref.watch(anomaliesProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Anomaly History'),
          actions: [
            IconButton(onPressed: () => context.push('/settings')
            , icon: const Icon(Icons.settings_outlined),)
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: anomalies.length,
          separatorBuilder: (_, __) => const SizedBox(height: 4),
          itemBuilder: (context, i) => AnomalyTile(anomaly: anomalies[i]),
        ),
        bottomNavigationBar: NavigationBar(
        destinations: [
          const NavigationDestination(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          const NavigationDestination(
              icon: Icon(Icons.history_outlined), label: 'History'),

          // <-- Ganti dengan logo dari assets
          NavigationDestination(
            icon: Image.asset(
              'assets/images/logo_anomeye.png',
              width: 24,
              height: 24,
            ),
            selectedIcon: Image.asset(
              'assets/images/logo_anomeye.png',
              width: 28, height: 28, // sedikit lebih besar saat terpilih
            ),
            label: 'Account',
            tooltip: 'Account',
          ),
        ],
        onDestinationSelected: (i) {
          if (i == 0) context.go('/');
          if (i == 1) context.go('/history');
          if (i == 2) context.go('/account');
        },
        selectedIndex: 1,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Quick sign-out demo
          ref.read(authStateProvider.notifier).state = false;
          context.go('/sign-in');
        },
        label: const Text('Sign out'),
        icon: const Icon(Icons.logout),
      ),
      );
  }
}
