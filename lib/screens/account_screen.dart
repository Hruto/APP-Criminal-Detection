import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anomeye/providers/auth_provider.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // biru utama
    const bg = Color(0xFFF4F7FA);   // latar belakang lembut

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: const Color(0xFF024670),
        centerTitle: true,
        title: SizedBox(
          height: 50,
          child: Image.asset('assets/images/anomeye.png',fit: BoxFit.contain,),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // KARTU BIRU BESAR
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              decoration: BoxDecoration(
                color: Color(0xFF024670),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  // AVATAR BULAT ABU
                  Container(
                    height: 140,
                    width: 140,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE2E5EA),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 22),

                  // FIELD PIL BULAT – USERNAME
                  const _PillInfo(text: 'Username : ABCD'),
                  const SizedBox(height: 12),

                  // FIELD PIL BULAT – EMAIL
                  const _PillInfo(text: 'E-mail : anomeye@gmail.com'),
                  const SizedBox(height: 8),

                  // LINK CHANGE PASSWORD? di kanan
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push('/forgot-password'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                      ),
                      child: const Text(
                        'Change password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // TOMBOL LOG OUT (PUTIH, TEKS MERAH) – PIL BULAT
                  SizedBox(
                    width: 140,
                    child: OutlinedButton(
                      onPressed: () {
                        ref.read(authStateProvider.notifier).state = false;
                        context.go('/sign-in');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: const StadiumBorder(),
                        side: BorderSide.none,
                        textStyle: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      child: const Text('Log out'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
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

// Widget kecil untuk “input” putih bulat
class _PillInfo extends StatelessWidget {
  final String text;
  const _PillInfo({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
