import 'package:example/widgets/pemission_button.dart';
import 'package:flutter/material.dart';
import 'package:permission_guard/permission_guard.dart';
import 'package:permission_guard/utils/readability.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permissions Gaurd',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: const Color(0xFFF58229)),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF58229)),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PermissionButton(
              permissionScreen: PermissionGaurdScreen.location(
                onAllow: () => Navigator.pop(context),
                onSkip: () => Navigator.pop(context),
              ),
              permission: 'Location',
            ),
            PermissionButton(
              permissionScreen: PermissionGaurdScreen.notification(
                onAllow: () => Navigator.pop(context),
                onSkip: () => Navigator.pop(context),
              ),
              permission: 'Notification',
            ),
            PermissionButton(
              permissionScreen: PermissionGaurdScreen.bluetooth(
                onAllow: () => Navigator.pop(context),
                onSkip: () => Navigator.pop(context),
              ),
              permission: 'Bluetooth',
            ),
          ],
        ),
      ),
    );
  }
}
