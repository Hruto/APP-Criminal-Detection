import 'package:anomeye/features/anomalies/data/anomalies_repo_fake.dart';
import 'package:anomeye/features/anomalies/presentation/anomaly_controllers.dart';
import 'package:anomeye/features/cameras/data/cameras_repo_fake.dart';
import 'package:anomeye/features/cameras/presentation/cameras_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anomeye/app/theme/app_theme.dart';
import 'package:anomeye/app/router.dart';

void main() {
  runApp(ProviderScope(overrides: [
    // Override provider untuk kamera
    camerasRepoProvider.overrideWithValue(CamerasRepoFake()),

    // Override provider untuk anomali
    anomaliesRepoProvider.overrideWithValue(AnomaliesRepoFake()),
  ], child: const AnomEyeApp()));
}

class AnomEyeApp extends ConsumerWidget {
  const AnomEyeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.light;
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AnomEye',
      theme: theme,
      routerConfig: router,
    );
  }
}
