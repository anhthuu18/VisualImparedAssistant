import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../pages/onboarding_page_1.dart';
import '../pages/onboarding_page_2.dart';
import '../pages/onboarding_page_3.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
import '../widgets/page_indicator.dart';
import 'google_login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _goToNextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to Login Screen
      _navigateToLogin();
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const GoogleLoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            // PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: const [
                  OnboardingPage1(),
                  OnboardingPage2(),
                  OnboardingPage3(),
                ],
              ),
            ),

            // Page Indicator
            PageIndicator(currentPage: _currentPage, totalPages: _totalPages),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingLG,
                vertical: AppDimensions.paddingLG,
              ),
              child: _currentPage < _totalPages - 1
                  ? Row(
                      children: [
                        if (_currentPage > 0)
                          Expanded(
                            child: SecondaryButton(
                              label: AppStrings.buttonBack,
                              onPressed: _goToPreviousPage,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        if (_currentPage > 0)
                          const SizedBox(width: AppDimensions.paddingLG),
                        Expanded(
                          child: PrimaryButton(
                            label: AppStrings.buttonNext,
                            onPressed: _goToNextPage,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    )
                  : PrimaryButton(
                      label: AppStrings.buttonStart,
                      onPressed: _navigateToLogin,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
