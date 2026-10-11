import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_styles.dart';

/// Central hero typography with highlighted "appointments," keyword.
class OnboardingHeroText extends StatelessWidget {
  const OnboardingHeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTextStyles.headlineLarge.copyWith(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              height: 1.25,
            ),
            children: [
              const TextSpan(
                text: AppStrings.onboardingTitlePart1,
                style: TextStyle(color: AppColors.textPrimary),
              ),
              const TextSpan(
                text: AppStrings.onboardingTitleHighlight,
                style: TextStyle(color: AppColors.primary),
              ),
              const TextSpan(
                text: AppStrings.onboardingTitlePart2,
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppStrings.onboardingDescription,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
              fontSize: 15.5,
            ),
          ),
        ),
      ],
    );
  }
}
