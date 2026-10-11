import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:anandaakachu896/core/constants/app_strings.dart';
import 'package:anandaakachu896/features/onboarding/screens/onboarding_screen.dart';
import 'package:anandaakachu896/features/auth/screens/register_screen.dart';
import 'package:anandaakachu896/features/auth/screens/verify_email_screen.dart';
import 'package:anandaakachu896/features/subscription/screens/subscription_screen.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return MaterialApp(home: child);
  }

  testWidgets('OnboardingScreen renders header and get started button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const OnboardingScreen()));

    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(find.text(AppStrings.getStarted), findsOneWidget);
  });

  testWidgets('RegisterScreen renders all input fields and create account button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const RegisterScreen()));

    expect(find.text(AppStrings.createAccountTitle), findsOneWidget);
    expect(find.text(AppStrings.fullNameHint), findsOneWidget);
    expect(find.text(AppStrings.emailHint), findsOneWidget);
    expect(find.text(AppStrings.passwordHint), findsOneWidget);
    expect(find.text(AppStrings.confirmPasswordHint), findsOneWidget);
    expect(find.text(AppStrings.createAccountButton), findsOneWidget);
  });

  testWidgets('VerifyEmailScreen renders 6 OTP boxes and continue button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const VerifyEmailScreen()));

    expect(find.text(AppStrings.verifyEmailTitle), findsOneWidget);
    expect(find.text(AppStrings.checkInboxTitle), findsOneWidget);
    expect(find.text(AppStrings.continueButton), findsOneWidget);
    expect(find.text(AppStrings.resendCode), findsOneWidget);
  });

  testWidgets('SubscriptionScreen renders Pro Plan pricing and features',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SubscriptionScreen()));

    expect(find.text(AppStrings.subscriptionTitle), findsOneWidget);
    expect(find.text(AppStrings.proPlan), findsOneWidget);
    expect(find.text(AppStrings.planPrice), findsOneWidget);
    expect(find.text('AI WhatsApp assistant'), findsOneWidget);
    expect(find.text(AppStrings.continueToPayment), findsOneWidget);
  });
}
