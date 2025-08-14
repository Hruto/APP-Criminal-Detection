import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anomeye/screens/sign_in.dart';
import 'package:anomeye/screens/home_dashboard.dart';
import 'package:anomeye/screens/camera_detail.dart';
import 'package:anomeye/screens/anomaly_history.dart';
import 'package:anomeye/screens/settings.dart';
import 'package:anomeye/screens/sign_up.dart';
import 'package:anomeye/ui/auth/forgot_password.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/sign-in',
    routes: [
      GoRoute(
        path: '/sign-in',
        name: 'sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeDashboard(),
      ),
      GoRoute(
        path: '/camera/:id',
        name: 'camera-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CameraDetailScreen(cameraId: id);
        },
      ),
      GoRoute(
        path: '/forgot-password', 
        builder: (context,state) => const ForgotPasswordScreen()
        ),
      GoRoute(
        path: '/sign-up', 
        builder: (content, state) => const SignUpScreen()
      ),
      GoRoute(
        path: '/history',
        name: 'history',
        builder: (context, state) => const AnomalyHistoryScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    redirect: (context, state) {
      // Simple auth gate example could go here
      return null;
    },
  );
});
