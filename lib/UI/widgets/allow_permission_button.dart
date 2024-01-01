import 'package:flutter/material.dart';
import 'package:permission_guard/utils/readability.dart';

class AllowPermissionButton extends StatelessWidget {
  const AllowPermissionButton({
    super.key,
    required this.onAllow,
    required this.allowButtonWidget,
    required this.allowButtonText,
  });

  final VoidCallback onAllow;
  final Widget? allowButtonWidget;
  final String? allowButtonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAllow,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          minimumSize: Size(context.width * 0.8, 50)),
      child: allowButtonWidget ?? Text(allowButtonText ?? 'Allow'),
    );
  }
}
