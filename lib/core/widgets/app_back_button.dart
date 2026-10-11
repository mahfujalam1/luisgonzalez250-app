import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Clean chevron back button matching the design screens.
class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed ?? () => Navigator.maybePop(context),
          borderRadius: BorderRadius.circular(12),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Icon(
              Icons.chevron_left_rounded,
              size: 32,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
