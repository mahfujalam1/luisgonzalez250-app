import 'package:flutter/material.dart';

/// Centralized color palette for the Bookeate application.
class AppColors {
  AppColors._();

  // Primary brand blues
  static const Color primary = Color(0xFF0066FF);
  static const Color primaryDark = Color(0xFF0052CC);
  static const Color primaryLight = Color(0xFF3385FF);
  static const Color primaryAccent = Color(0xFF1677FF);

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceSecondary = Color(0xFFF0F4FA);
  static const Color inputBackground = Color(0xFFF1F5FA);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color infoCardBackground = Color(0xFFF1F6FD);

  // Text colors
  static const Color textPrimary = Color(0xFF0D1C2E);
  static const Color textSecondary = Color(0xFF5A6E85);
  static const Color textMuted = Color(0xFF8195AB);
  static const Color textLink = Color(0xFF0066FF);

  // Borders & Dividers
  static const Color borderLight = Color(0xFFE2ECF8);
  static const Color borderFocused = Color(0xFF0066FF);
  static const Color divider = Color(0xFFEDF2F8);

  // Subtle Wave Tints
  static const Color waveLight = Color(0xFFF4F8FD);
  static const Color waveMedium = Color(0xFFE7F1FD);
  static const Color waveAccent = Color(0xFFD6E7FC);

  // Status & Badges
  static const Color badgeBackground = Color(0xFFE8F1FD);
  static const Color checkmarkGreen = Color(0xFF10B981);
  static const Color iconMuted = Color(0xFF8E9EAF);
}
