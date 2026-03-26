import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../constants/app_dimensions.dart';
import '../widgets/onboarding_header.dart';
import '../widgets/onboarding_content.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.paddingHuge),
            child: OnboardingHeader(
              subtitle: AppStrings.onboardingTitle,
              title: AppStrings.onboarding3Title,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingXXL,
              horizontal: AppDimensions.paddingLG,
            ),
            child: Image.asset(
              'assets/images/onboarding3.png',
              height: AppDimensions.imageHeightMD,
              fit: BoxFit.contain,
            ),
          ),

          OnboardingContent(description: AppStrings.onboarding3Description),
        ],
      ),
    );
  }
}
