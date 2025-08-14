import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anomeye/providers/camera_provider.dart';
import 'package:anomeye/widgets/section_header.dart';
import 'package:anomeye/widgets/camera_card.dart';
import 'package:anomeye/providers/auth_provider.dart';

class HomeDashboard extends ConsumerWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameras = ref.watch(camerasProvider);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 208, 209),
      appBar: AppBar(
        title: const Text('AnomEye'),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: 'Live Cameras',
                onSeeAll: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('See all cameras tapped')),
                ), titlewhite: '',
              ),
              const SizedBox(height: 8),
              GridView.builder(
                itemCount: cameras.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final c = cameras[index];
                  return CameraCard(
                    camera: c,
                    onTap: () => context.push('/camera/${c.id}'),
                  );
                },
              ),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'Recent Alerts',
                onSeeAll: () => context.push('/history'), titlewhite: '',
              ),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.warning_amber_rounded),
                  title: const Text('2 new anomalies detected'),
                  subtitle: const Text('Last 1 hour'),
                  trailing: TextButton(
                    onPressed: () => context.push('/history'),
                    child: const Text('Review'),
                  ),
                ),
              ),
            ],
          ),
        ),
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
        selectedIndex: 0,
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
