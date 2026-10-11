import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/navigation/route_names.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/wave_background.dart';
import '../widgets/otp_code_inputs.dart';
import '../widgets/verify_email_header.dart';

/// Screen for verifying user email address via 6-digit OTP code.
class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    this.email = AppStrings.defaultVerificationEmail,
  });

  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String _enteredCode = '';
  bool _isLoading = false;

  void _handleContinue() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() => _isLoading = false);
        // Navigate with verified code state
        debugPrint('Verifying code: $_enteredCode');
        Navigator.of(context).pushNamed(RouteNames.subscription);
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
          child: Padding(
            padding: AppDimens.horizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerifyEmailHeader(),
                const Spacer(flex: 2),
                Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: AppColors.badgeBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.mark_email_read_outlined,
                      color: AppColors.primary,
                      size: 34,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    AppStrings.checkInboxTitle,
                    style: AppTextStyles.titleLarge.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                      children: [
                        const TextSpan(
                          text: '${AppStrings.checkInboxSubtitle}\n',
                        ),
                        TextSpan(
                          text: widget.email,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                OtpCodeInputs(
                  onCompleted: (code) {
                    _enteredCode = code;
                    _handleContinue();
                  },
                  onChanged: (code) => _enteredCode = code,
                ),
                const Spacer(flex: 3),
                AppButton(
                  text: AppStrings.continueButton,
                  isLoading: _isLoading,
                  onPressed: _handleContinue,
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Verification code resent!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.resendCode,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
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
