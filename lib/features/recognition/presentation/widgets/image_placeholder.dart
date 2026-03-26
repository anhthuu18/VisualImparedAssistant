import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class ImagePlaceholder extends StatelessWidget {
  final double height;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double iconSize;

  const ImagePlaceholder({
    Key? key,
    this.height = AppDimensions.imageHeightMD,
    this.icon = Icons.image,
    this.backgroundColor,
    this.iconColor,
    this.iconSize = AppDimensions.iconXXL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.darkSurface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        border: Border.all(color: AppColors.borderColor, width: 1.5),
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor ?? AppColors.primaryCyan,
        ),
      ),
    );
  }
}
