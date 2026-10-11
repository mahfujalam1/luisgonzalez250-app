import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Reusable wave background painter matching the bottom wave accents
/// visible across all design reference screens.
class WaveBackground extends StatelessWidget {
  const WaveBackground({
    super.key,
    this.child,
    this.waveHeight = 220.0,
  });

  final Widget? child;
  final double waveHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: waveHeight,
          child: const IgnorePointer(
            child: CustomPaint(
              painter: _WavePainter(),
            ),
          ),
        ),
        ?child,
      ],
    );
  }
}

class _WavePainter extends CustomPainter {
  const _WavePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Back wave - softest tint
    final Paint backPaint = Paint()
      ..color = AppColors.waveLight.withValues(alpha: 0.9)
      ..style = PaintingStyle.fill;

    final Path backPath = Path()
      ..moveTo(0, h * 0.45)
      ..quadraticBezierTo(w * 0.28, h * 0.20, w * 0.58, h * 0.42)
      ..quadraticBezierTo(w * 0.82, h * 0.58, w, h * 0.35)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(backPath, backPaint);

    // Middle wave
    final Paint midPaint = Paint()
      ..color = AppColors.waveMedium.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;

    final Path midPath = Path()
      ..moveTo(0, h * 0.65)
      ..quadraticBezierTo(w * 0.25, h * 0.48, w * 0.52, h * 0.62)
      ..quadraticBezierTo(w * 0.80, h * 0.74, w, h * 0.55)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(midPath, midPaint);

    // Front bottom wave
    final Paint frontPaint = Paint()
      ..color = AppColors.waveAccent.withValues(alpha: 0.65)
      ..style = PaintingStyle.fill;

    final Path frontPath = Path()
      ..moveTo(0, h * 0.82)
      ..quadraticBezierTo(w * 0.30, h * 0.70, w * 0.62, h * 0.84)
      ..quadraticBezierTo(w * 0.85, h * 0.94, w, h * 0.76)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(frontPath, frontPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
