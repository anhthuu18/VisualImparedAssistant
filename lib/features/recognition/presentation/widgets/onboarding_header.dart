import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class OnboardingHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final EdgeInsetsGeometry padding;

  const OnboardingHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
        ],
        Padding(
          padding: padding,
          child: Text(
            title,
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
