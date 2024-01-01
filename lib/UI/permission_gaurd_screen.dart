import 'package:flutter/material.dart';
import 'package:permission_guard/UI/widgets/skip_permission_button.dart';
import 'package:permission_guard/utils/readability.dart';

import 'widgets/allow_permission_button.dart';

/// Only one of [allowButtonText] and [allowButtonWidget] can be specified.
/// Only one of [skipButtonText] and [skipButtonWidget] can be specified.

class PermissionGaurdScreen extends StatelessWidget {
  ///  A one-line description used to inform the user which permission you need to be allowed.
  final String title;

  /// Type a clear description to inform the user why? and where? you will use the granted permission in your app.
  final String description;

  /// This widget Used above title, it gives the user a visual view of the required access permission , default will be [FlutterLogo],but you can Use icon,image,svg,animation ...etc .
  final Widget? icon;

  /// [allowButtonText] appears in the center of allow button if you didn't add widget.
  final String? allowButtonText;

  /// [allowButtonWidget] appears in the center of allow button.
  final Widget? allowButtonWidget;

  /// [allowButtonText] appears in the center of skip button if you didn't add widget.
  final String? skipButtonText;

  /// [allowButtonWidget] appears in the center of skip button.
  final Widget? skipButtonWidget;

  /// [onAllow] is a [VoidCallback] to be invoked when user taps [AllowPermissionButton]
  final VoidCallback onAllow;

  /// you can identify even permission can be skipped or not.
  final bool canSkip;

  /// [onSkip] is a [VoidCallback] to be invoked when user taps [SkipPermissionButton]
  final VoidCallback? onSkip;

  PermissionGaurdScreen(
      {super.key,
      required this.title,
      required this.description,
      this.icon = const FlutterLogo(size: 150),
      this.allowButtonText,
      this.allowButtonWidget,
      this.skipButtonText,
      this.skipButtonWidget,
      required this.onAllow,
      this.onSkip,
      this.canSkip = true})
      : assert(title.isNotEmpty, 'Please Make Sure title is not Empty'),
        assert(!(allowButtonText != null && allowButtonWidget != null),
            'Declaring both [allowButtonText] and [allowButtonWidget] is not supported.'),
        assert(!(skipButtonText != null && skipButtonWidget != null),
            'Declaring both [skipButtonText] and [skipButtonWidget] is not supported.'),
        assert((canSkip && onSkip == null),
            'a callback function [onSkip] can not be null if permission canSkip');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Expanded(flex: 2, child: icon!),
              const Spacer(),
              Text(
                title,
                style: context.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              ButtonBar(
                children: [
                  // Allow Button
                  AllowPermissionButton(
                      onAllow: onAllow,
                      allowButtonWidget: allowButtonWidget,
                      allowButtonText: allowButtonText),
                  const SizedBox(
                    height: 16,
                  ),
                  // Skip Button
                  if (canSkip)
                    SkipPermissionButton(
                        onskip: () => onSkip,
                        skipButtonWidget: skipButtonWidget,
                        skipButtonText: skipButtonText),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
