import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/theme/app_text_styles.dart';

/// 6-digit OTP code inputs matching the design boxes with dash placeholders.
class OtpCodeInputs extends StatefulWidget {
  const OtpCodeInputs({
    super.key,
    required this.onCompleted,
    this.onChanged,
  });

  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;

  @override
  State<OtpCodeInputs> createState() => _OtpCodeInputsState();
}

class _OtpCodeInputsState extends State<OtpCodeInputs> {
  static const int _codeLength = 6;
  final List<TextEditingController> _controllers = List.generate(
    _codeLength,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    _codeLength,
    (_) => FocusNode(),
  );

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(int index, String value) {
    if (value.isNotEmpty) {
      if (index < _codeLength - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
    final String fullCode = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(fullCode);
    if (fullCode.length == _codeLength) {
      widget.onCompleted(fullCode);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_codeLength, (index) {
        final bool hasValue = _controllers[index].text.isNotEmpty;
        final bool isFocused = _focusNodes[index].hasFocus;

        return SizedBox(
          width: 46,
          height: 52,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceSecondary,
                  borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                  border: Border.all(
                    color: isFocused ? AppColors.primary : Colors.transparent,
                    width: 1.5,
                  ),
                ),
              ),
              if (!hasValue)
                const Text(
                  '—',
                  style: TextStyle(
                    color: AppColors.iconMuted,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.textPrimary,
                ),
                cursorColor: AppColors.primary,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (val) => _onDigitChanged(index, val),
              ),
            ],
          ),
        );
      }),
    );
  }
}
