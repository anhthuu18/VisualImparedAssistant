import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';

class OnboardingContent extends StatelessWidget {
  final String description;
  final EdgeInsetsGeometry padding;

  const OnboardingContent({
    Key? key,
    required this.description,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppDimensions.paddingLG,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        description,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
