import 'dart:developer';

import '../permission_guard.dart';

class Permit {
  static location() async {
    try {
      await Permission.location.request().isGranted;
      final status = await Permission.location.request();
      log(status.toString());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static notification() async {
    try {
      await Permission.notification.request().isGranted;
      final status = await Permission.notification.request();
      log(status.toString());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static bluetooth() async {
    try {
      await Permission.bluetooth.request().isGranted;
      final status = await Permission.bluetooth.request();
      log(status.toString());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
