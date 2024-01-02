import 'package:flutter/material.dart';

class PermissionButton extends StatelessWidget {
  const PermissionButton({
    super.key,
    required this.permissionScreen,
    required this.permission,
  });
  final Widget permissionScreen;
  final String permission;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => permissionScreen),
        );
      },
      child: Text(permission),
    );
  }
}
