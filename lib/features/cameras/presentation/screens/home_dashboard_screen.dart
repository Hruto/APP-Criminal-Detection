import 'package:anomeye/features/cameras/presentation/screens/cameras_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anomeye/shared/widgets/section_header.dart';
import 'package:anomeye/features/cameras/presentation/widgets/camera_card.dart';

// Create a provider to track the current navigation index
final currentNavIndexProvider = StateProvider<int>((ref) => 0);

class HomeDashboard extends ConsumerWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameras = ref.watch(camerasListProvider);
    // Get the current navigation index
    final currentIndex = ref.watch(currentNavIndexProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFF024670),
        //automaticallyImplyLeading: false,
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
                ),
                titlewhite: '',
              ),
              const SizedBox(height: 8),
              GridView.builder(
                itemCount: cameras.value?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio:
                      0.8, // Adjust this value to give more vertical space
                ),
                itemBuilder: (context, index) {
                  final c = cameras.value?[index];
                  return CameraCard(
                    camera: c!,
                    onTap: () => context.push('/camera/${c.id}'),
                  );
                },
              ),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'Recent Alerts',
                onSeeAll: () => context.push('/history'),
                titlewhite: '',
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
          selectedIndex: currentIndex,
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
          onDestinationSelected: (index) {
            // Update the current index
            ref.read(currentNavIndexProvider.notifier).state = index;

            // Navigate based on the selected index
            switch (index) {
              case 0:
                context.go('/');
                break;
              case 1:
                context.go('/history');
                break;
              case 2:
                context.go('/account');
                break;
            }
          },
        ),
      ),
    );
  }
}
