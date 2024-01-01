import 'package:flutter/material.dart';
import 'package:permission_guard/utils/readability.dart';

class SkipPermissionButton extends StatelessWidget {
  const SkipPermissionButton({
    super.key,
    required this.onskip,
    required this.skipButtonWidget,
    required this.skipButtonText,
  });

  final VoidCallback onskip;
  final Widget? skipButtonWidget;
  final String? skipButtonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onskip,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(
                color:
                    Theme.of(context).primaryColor), //?? AppTheme.primaryColor
          ),
          minimumSize: Size(context.width * 0.8, 50)),
      child: skipButtonWidget ?? Text(skipButtonText ?? 'Skip for now'),
    );
  }
}
