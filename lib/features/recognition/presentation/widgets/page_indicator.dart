import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Color activeColor;
  final Color inactiveColor;
  final EdgeInsetsGeometry padding;

  const PageIndicator({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    this.activeColor = AppColors.primaryCyan,
    this.inactiveColor = AppColors.borderColor,
    this.padding = const EdgeInsets.symmetric(
      vertical: AppDimensions.paddingLG,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalPages,
          (index) => Container(
            width: index == currentPage ? 24 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: index == currentPage ? activeColor : inactiveColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
