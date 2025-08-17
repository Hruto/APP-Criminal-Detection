import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Global provider to track the current navigation index across all screens
final currentNavIndexProvider = StateProvider<int>((ref) => 0);

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentNavIndexProvider);

    return NavigationBarTheme(
      data: const NavigationBarThemeData(
        backgroundColor: Color(0xFF024670),
        indicatorColor: Colors.white12,
        iconTheme: MaterialStatePropertyAll(IconThemeData(color: Colors.white)),
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
              color: Colors.white,
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
    );
  }
}
