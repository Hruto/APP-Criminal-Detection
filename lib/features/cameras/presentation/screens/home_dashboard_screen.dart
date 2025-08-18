import 'package:anomeye/features/cameras/presentation/cameras_controller.dart';
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
    // Memastikan provider dipanggil setelah frame pertama selesai di-build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // FIX: Memanggil data saat screen pertama kali dibuka
      ref.read(camerasListProvider.notifier).load();
      // Mengatur index navigasi (jika provider ini ada)
      // ref.read(currentNavIndexProvider.notifier).state = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tonton provider untuk update UI secara otomatis
    final camerasAsyncValue = ref.watch(camerasListProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
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
            onPressed: () {}, // Ganti dengan navigasi ke settings
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ],
      ),
      // FIX: Menggunakan .when untuk menangani semua state (loading, error, data)
      body: camerasAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (cameras) => RefreshIndicator(
          onRefresh: () => ref.read(camerasListProvider.notifier).load(),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // --- Bagian Live Cameras ---
              SectionHeader(
                title: 'Live Cameras',
                onSeeAll: () {},
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
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final camera = cameras[index];
                  return CameraCard(
                    camera: camera,
                    onTap: () => context.push('/camera/${camera.id}'),
                  );
                },
              ),
              const SizedBox(height: 24),

              // --- Bagian Recent Alerts ---
              SectionHeader(
                title: 'Recent Alerts',
                onSeeAll: () => context.push('/history'),
              ),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.warning_amber_rounded,
                      color: Colors.orange),
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
