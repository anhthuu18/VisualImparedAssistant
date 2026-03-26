import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_button.dart';
import '../widgets/image_placeholder.dart';
import '../../recognition_home_page.dart';

class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({Key? key}) : super(key: key);

  @override
  State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  bool _isLoading = false;

  void _handleGoogleLogin() {
    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isLoading = false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RecognitionHomePage()),
        );
      }
    });
  }

  void _navigateToSignUp() {
    // TODO: Navigate to Sign Up Screen
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Navigate to Sign Up Screen')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Eye Icon / Logo
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.paddingXXL,
                ),
                child: Icon(
                  Icons.visibility_rounded,
                  size: AppDimensions.iconXXL,
                  color: AppColors.primaryCyan,
                ),
              ),

              // Title and Description
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingLG,
                  vertical: AppDimensions.paddingXL,
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.loginTitle,
                      style: AppTextStyles.heading1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDimensions.paddingXL),
                    Text(
                      AppStrings.loginDescription,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Google Login Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingLG,
                  vertical: AppDimensions.paddingXXL,
                ),
                child: PrimaryButton(
                  label: AppStrings.buttonGoogleLogin,
                  onPressed: _handleGoogleLogin,
                  isLoading: _isLoading,
                  padding: EdgeInsets.zero,
                ),
              ),

              // Sign Up Link
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingLG,
                  vertical: AppDimensions.paddingXL,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.loginNoAccount,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.loginSignUp,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryCyan,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _navigateToSignUp,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppDimensions.paddingLG),

              // Footer Links
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingLG,
                  vertical: AppDimensions.paddingXL,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButtonWidget(
                      label: AppStrings.loginPrivacy,
                      onPressed: () {
                        // TODO: Open Privacy Policy
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Open Privacy Policy')),
                        );
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingMD,
                      ),
                    ),
                    Text(
                      '|',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.borderColor,
                      ),
                    ),
                    TextButtonWidget(
                      label: AppStrings.loginTerms,
                      onPressed: () {
                        // TODO: Open Terms of Service
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Open Terms of Service'),
                          ),
                        );
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingMD,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
