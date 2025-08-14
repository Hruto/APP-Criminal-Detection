import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anomeye/theme/app_theme.dart';
import 'package:anomeye/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: AnomEyeApp()));
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
