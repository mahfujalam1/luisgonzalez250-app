import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';

/// Bottom action area for subscription checkout with security note.
class SubscriptionFooter extends StatelessWidget {
  const SubscriptionFooter({
    super.key,
    required this.onContinueToPayment,
    this.isLoading = false,
  });

  final VoidCallback onContinueToPayment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton(
          text: AppStrings.continueToPayment,
          isLoading: isLoading,
          onPressed: onContinueToPayment,
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shield_outlined,
              size: 16,
              color: AppColors.iconMuted,
            ),
            const SizedBox(width: 6),
            Text(
              AppStrings.recurringBillingNotice,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
