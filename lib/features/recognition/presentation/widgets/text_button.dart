import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';

class TextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Color? textColor;

  const TextButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppDimensions.paddingMD,
      vertical: AppDimensions.paddingSM,
    ),
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: textColor ?? AppColors.primaryCyan,
          ),
        ),
      ),
    );
  }
}
