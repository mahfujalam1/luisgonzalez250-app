import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/navigation/route_names.dart';
import '../../../core/widgets/wave_background.dart';
import '../widgets/register_footer.dart';
import '../widgets/register_form.dart';
import '../widgets/register_header.dart';

/// Account registration screen matching reference image 3.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleCreateAccount() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() => _isLoading = false);
        final String email = _emailController.text.trim().isNotEmpty
            ? _emailController.text.trim()
            : 'emma@bellabeauty.es';
        Navigator.of(context).pushNamed(
          RouteNames.verifyEmail,
          arguments: email,
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
                        const RegisterHeader(),
                        const SizedBox(height: AppDimens.xl),
                        RegisterForm(
                          nameController: _nameController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          confirmPasswordController:
                              _confirmPasswordController,
                        ),
                        const Spacer(),
                        const SizedBox(height: AppDimens.xl),
                        RegisterFooter(
                          isLoading: _isLoading,
                          onCreateAccount: _handleCreateAccount,
                        ),
                        const SizedBox(height: 24),
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
