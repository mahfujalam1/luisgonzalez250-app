import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/navigation/route_names.dart';
import '../../../core/widgets/wave_background.dart';
import '../widgets/onboarding_footer.dart';
import '../widgets/onboarding_header.dart';
import '../widgets/onboarding_hero_text.dart';

/// Onboarding screen introducing users to the value proposition of Bookeate.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: WaveBackground(
        waveHeight: 220,
        child: SafeArea(
          child: Padding(
            padding: AppDimens.horizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OnboardingHeader(),
                const Spacer(flex: 3),
                const OnboardingHeroText(),
                const Spacer(flex: 4),
                OnboardingFooter(
                  onGetStarted: () {
                    Navigator.of(context).pushNamed(RouteNames.register);
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
