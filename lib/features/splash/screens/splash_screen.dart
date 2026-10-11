import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/navigation/route_names.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/puzzle_logo.dart';
import '../../../core/widgets/wave_background.dart';
import '../widgets/splash_progress_bar.dart';

/// Splash screen that greets user and automatically transitions to Onboarding.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _navigationTimer = Timer(const Duration(milliseconds: 2400), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(RouteNames.onboarding);
      }
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: WaveBackground(
        waveHeight: 250,
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),
              const BookeateLogo(size: 130),
              const SizedBox(height: AppDimens.lg),
              Text(
                AppStrings.appName,
                style: AppTextStyles.headlineLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: AppDimens.sm),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Text(
                  AppStrings.splashTagline,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ),
              const Spacer(flex: 4),
              const SplashProgressBar(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
