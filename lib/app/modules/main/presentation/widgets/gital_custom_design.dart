import 'package:flutter/material.dart';
import 'package:gital_flutter/app/values/palette.dart';

class GitalCustomDesign extends StatelessWidget {
  const GitalCustomDesign({
    super.key,
    required this.label,
    required this.iconAsset,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final dynamic iconAsset;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const selectedBgColor = Palette.backgroundDarkenPrimary;
    const selectedIconColor = Palette.foregroundPrimary;
    const unselectedIconColor = Palette.foregroundPrimary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? selectedBgColor : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconAsset.svg(
                width: 24.0,
                height: 24.0,
                colorFilter: ColorFilter.mode(
                  isSelected ? selectedIconColor : unselectedIconColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                label,
                style: TextStyle(
                  color: Palette.foregroundMutedPrimary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pretendard',
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
