import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/gital_pressable.dart';
import 'package:gital_flutter/app/values/palette.dart';

// 버튼 유형
enum GitalButtonType { onlyIcon, onlyText, iconAndText }

class GitalButton extends StatelessWidget {
  // 1. [Named Constructor] - 사용 목적에 따라 생성자 분리

  const GitalButton.onlyIcon({super.key, required this.icon, this.onTap})
    : type = GitalButtonType.onlyIcon,
      text = null;

  const GitalButton.onlyText({super.key, required this.text, this.onTap})
    : type = GitalButtonType.onlyText,
      icon = null;

  const GitalButton.iconAndText({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  }) : type = GitalButtonType.iconAndText;

  // 2. [Fields] - 공통 파라미터
  final String? text;
  final VoidCallback? onTap;
  final Widget? icon;
  final GitalButtonType type;

  @override
  Widget build(BuildContext context) {
    // 3. [Integration] - GitalPressable 활용
    return GitalPressable(
      onTap: onTap,
      child: Container(
        // 4. [Design] - 정적인 스타일링 (배경색, 테두리, 패딩)
        padding: _padding,
        decoration: BoxDecoration(
          color: _backgroundColor,
          shape: type == GitalButtonType.onlyIcon
              ? BoxShape.circle
              : BoxShape.rectangle,
          borderRadius: _borderRadius,
          border: _border,
        ),
        // 5. [Layout] - 아이콘 + 텍스트 배치
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null && (text?.isNotEmpty ?? false))
              const SizedBox(width: 10),
            if (text != null && text!.isNotEmpty)
              Text(text!, style: _textStyle),
          ],
        ),
      ),
    );
  }

  // --- [Style Getters] ---

  Color get _backgroundColor {
    if (onTap == null) return const Color(0xFFE0E0E0); // 비활성화 색상

    switch (type) {
      case GitalButtonType.onlyIcon:
        return Palette.primary;
      case GitalButtonType.onlyText:
        return Palette.primary;
      case GitalButtonType.iconAndText:
        return Palette.primary;
    }
  }

  TextStyle? get _textStyle {
    if (onTap == null) {
      return const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xFFB3B3B3),
        height: 1.5,
        letterSpacing: -0.5,
      ); // 비활성화 텍스트
    }

    switch (type) {
      case GitalButtonType.onlyIcon:
        return null;
      case GitalButtonType.onlyText:
        return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.5,
          letterSpacing: -0.5,
        );
      case GitalButtonType.iconAndText:
        return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.5,
          letterSpacing: -0.5,
        );
    }
  }

  EdgeInsetsGeometry get _padding {
    switch (type) {
      case GitalButtonType.onlyIcon:
        return const EdgeInsets.all(10);
      case GitalButtonType.onlyText:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case GitalButtonType.iconAndText:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    }
  }

  BorderRadiusGeometry? get _borderRadius {
    switch (type) {
      case GitalButtonType.onlyIcon:
        return null;
      case GitalButtonType.onlyText:
        return BorderRadius.circular(12);
      case GitalButtonType.iconAndText:
        return BorderRadius.circular(100);
    }
  }

  BoxBorder? get _border {
    switch (type) {
      case GitalButtonType.onlyIcon:
        return null;
      case GitalButtonType.onlyText:
        return null;
      case GitalButtonType.iconAndText:
        return null;
    }
  }
}
