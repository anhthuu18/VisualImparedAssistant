import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final double height;
  final EdgeInsetsGeometry padding;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
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
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryCyan,
            disabledBackgroundColor: AppColors.borderColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
            ),
            elevation: 0,
          ),
          child: isLoading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.darkBackground,
                    ),
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  label,
                  style: AppTextStyles.buttonText.copyWith(
                    color: AppColors.darkBackground,
                  ),
                ),
        ),
      ),
    );
  }
}
