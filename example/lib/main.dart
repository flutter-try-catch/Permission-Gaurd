import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_guard/permission_guard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: PermissionGaurdScreen(
        title: 'Permission',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra finibus metus non ultricies. Nullam condimentum lobortis eros quis commodo. Maecenas condimentum accumsan nulla non finibus. Sed nec odio quis urna pulvinar faucibus. Morbi ut erat et lectus egestas vestibulum. Morbi vitae orci consequat, scelerisque turpis imperdiet, iaculis orci. Sed id iaculis lacus. Nullam mollis magna sed leo eleifend tristique.',
        onAllow: () {
          log('Allow Permission');
        },
      ),
    );
  }
}
