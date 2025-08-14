import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:anomeye/screens/sign_in.dart';
import 'package:anomeye/screens/home_dashboard.dart';
import 'package:anomeye/screens/camera_detail.dart';
import 'package:anomeye/screens/anomaly_history.dart';
import 'package:anomeye/screens/settings.dart';
import 'package:anomeye/screens/sign_up.dart';
import 'package:anomeye/ui/auth/forgot_password.dart';
import 'package:anomeye/screens/account_screen.dart';

CustomTransitionPage<T> _slidePage<T>({
  required GoRouterState state,
  required Widget child,
  Duration duration = const Duration(milliseconds: 280),
  Curve curve = Curves.easeOutCubic,
}) {
  final tween = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
      .chain(CurveTween(curve: curve));
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: const Duration(milliseconds: 220),
    transitionsBuilder: (context, animation, secondary, child) =>
        SlideTransition(position: animation.drive(tween), child: child),
  );
}

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
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return _slidePage(state: state, child: CameraDetailScreen(cameraId: id),);
        },
      ),
      GoRoute(
        path: '/forgot-password', 
        builder: (context,state) => const ForgotPasswordScreen()
        ),
      GoRoute(
        path: '/sign-up',
        name: 'sign-up',
        pageBuilder: (context, state) => _slidePage(
          state: state,
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        path: '/history',
        name: 'history',
        pageBuilder: (context, state) => _slidePage(
          state: state,
          child: const AnomalyHistoryScreen(),
        ),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/account',
        name: 'account',
        pageBuilder: (context, state) => _slidePage(
          state: state,
          child: const AccountScreen(),
        ),
      ),
    ],
    redirect: (context, state) {
      // Simple auth gate example could go here
      return null;
    },
  );
});
