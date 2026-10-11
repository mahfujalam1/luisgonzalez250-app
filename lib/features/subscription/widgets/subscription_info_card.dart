import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_styles.dart';

/// Informational card summarizing coverage, VAT, and billing terms.
class SubscriptionInfoCard extends StatelessWidget {
  const SubscriptionInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.infoCardBackground,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      child: Text(
        AppStrings.subscriptionInfo,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textSecondary,
          fontSize: 13.5,
          height: 1.45,
        ),
      ),
    );
  }
}
