import 'package:flutter/material.dart';

/// Renders the signature Bookeate puzzle logo.
/// Supports both large (splash) and compact (header) presentation modes.
class BookeateLogo extends StatelessWidget {
  const BookeateLogo({
    super.key,
    this.size = 110.0,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Bookeate_logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return _FallbackPuzzleLogo(size: size);
      },
    );
  }
}

class _FallbackPuzzleLogo extends StatelessWidget {
  const _FallbackPuzzleLogo({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.22),
        gradient: const LinearGradient(
          colors: [Color(0xFF29B6F6), Color(0xFF0066FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0066FF).withValues(alpha: 0.3),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(
        Icons.extension_rounded,
        size: size * 0.58,
        color: Colors.white,
      ),
    );
  }
}
