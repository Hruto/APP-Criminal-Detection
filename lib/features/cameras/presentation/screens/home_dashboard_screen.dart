import 'package:anomeye/features/cameras/presentation/screens/cameras_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anomeye/shared/widgets/section_header.dart';
import 'package:anomeye/features/cameras/presentation/widgets/camera_card.dart';
import 'package:anomeye/shared/widgets/app_bottom_nav_bar.dart';

class HomeDashboard extends ConsumerStatefulWidget {
  const HomeDashboard({super.key});

  @override
  ConsumerState<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends ConsumerState<HomeDashboard> {
  @override
  void initState() {
    super.initState();
    // Set the current navigation index to 0 (Home) when this screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentNavIndexProvider.notifier).state = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cameras = ref.watch(camerasListProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  childAspectRatio: 0.8, // Adjusted for more vertical space
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
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
