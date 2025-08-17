import 'package:anomeye/features/anomalies/presentation/anomaly_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anomeye/features/anomalies/presentation/widgets/anomaly_tile.dart';

class AnomalyHistoryScreen extends ConsumerWidget {
  const AnomalyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: Color(0xFF024670),
          indicatorColor: Colors.white12,
          iconTheme:
              MaterialStatePropertyAll(IconThemeData(color: Colors.white)),
          labelTextStyle:
              MaterialStatePropertyAll(TextStyle(color: Colors.white)),
        ),
        child: NavigationBar(
          selectedIndex: 0,
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(Icons.history_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.history, color: Colors.white),
              label: 'History',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/images/logo_anomeye.png',
                width: 28,
                height: 28,
                color: Colors.white, // tint putih untuk asset
                colorBlendMode: BlendMode.srcIn,
              ),
              selectedIcon: Image.asset(
                'assets/images/logo_anomeye.png',
                width: 30,
                height: 30,
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
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
        ),
      ),
    );
  }
}
