import 'package:anomeye/app/di.dart';
import 'package:anomeye/shared/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 4),
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
                        ref.read(authStateProvider.notifier).signOut();
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
      bottomNavigationBar: const AppBottomNavBar(),
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
