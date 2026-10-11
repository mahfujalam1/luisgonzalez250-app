import 'package:flutter/material.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/verify_email_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../../features/subscription/screens/subscription_screen.dart';
import '../constants/app_strings.dart';
import 'route_names.dart';

/// Central application route generator with smooth page transitions.
class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return _buildRoute(const SplashScreen(), settings);

      case RouteNames.onboarding:
        return _buildRoute(const OnboardingScreen(), settings);

      case RouteNames.register:
        return _buildRoute(const RegisterScreen(), settings);

      case RouteNames.verifyEmail:
        final String email = settings.arguments is String
            ? settings.arguments as String
            : AppStrings.defaultVerificationEmail;
        return _buildRoute(VerifyEmailScreen(email: email), settings);

      case RouteNames.subscription:
        return _buildRoute(const SubscriptionScreen(), settings);

      default:
        return _buildRoute(const SplashScreen(), settings);
    }
  }

  static MaterialPageRoute<dynamic> _buildRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => page,
      settings: settings,
    );
  }
}
