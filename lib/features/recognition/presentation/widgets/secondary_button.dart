import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double height;
  final EdgeInsetsGeometry padding;

  const SecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.height = AppDimensions.buttonHeightLG,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppDimensions.paddingLG,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primaryCyan, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
            ),
          ),
          child: Text(label, style: AppTextStyles.buttonText),
        ),
      ),
    );
  }
}
