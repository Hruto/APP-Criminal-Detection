import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool autoRecord = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          return true;
        }
        context.goNamed('home');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.goNamed('home');
              }
            },
          ),
        ),
        body: ListView(
          children: [
            SwitchListTile(
              title: const Text('Push notifications'),
              value: notifications,
              onChanged: (v) => setState(() => notifications = v),
            ),
            SwitchListTile(
              title: const Text('Auto record on anomaly'),
              value: autoRecord,
              onChanged: (v) => setState(() => autoRecord = v),
            ),
            const AboutListTile(
              applicationName: 'AnomEye',
              applicationVersion: '0.1.0',
            ),
          ],
        ),
      ),
    );
  }
}
