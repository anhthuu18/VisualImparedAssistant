import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkSurface,
        elevation: 0,
        title: const Text('Trợ lý thị giác', style: AppTextStyles.heading3),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Chào mừng đến với Trợ lý thị giác',
          style: AppTextStyles.heading2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
