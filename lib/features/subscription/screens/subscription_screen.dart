import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/widgets/wave_background.dart';
import '../widgets/subscription_footer.dart';
import '../widgets/subscription_header.dart';
import '../widgets/subscription_info_card.dart';
import '../widgets/subscription_plan_card.dart';

/// Subscription selection screen matching reference image 5.
class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool _isLoading = false;

  void _handlePayment() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Payment process initiated successfully!'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: WaveBackground(
        waveHeight: 220,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: AppDimens.horizontalPadding,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SubscriptionHeader(),
                        const SizedBox(height: 20),
                        const SubscriptionPlanCard(),
                        const SizedBox(height: 14),
                        const SubscriptionInfoCard(),
                        const Spacer(),
                        const SizedBox(height: 24),
                        SubscriptionFooter(
                          isLoading: _isLoading,
                          onContinueToPayment: _handlePayment,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
