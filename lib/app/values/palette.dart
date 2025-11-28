import 'package:flutter/widgets.dart';

abstract class Palette {
  Palette._();

  // 1. Base Colors (기본)
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const primary = Color(0xFF58C1C8);

  // 2. Background Colors
  static const backgroundBlue = Color(0xFFF6F9FD);
  static const backgroundBlack = Color(0xFFF7F7F7);
  static const backgroundPrimary = Color(0xFFF4FAFB);
  static const backgroundDarkenBlack = Color(0xFFE2E2E2);
  static const backgroundDarkenBlue = Color(0xFFC4D6E9);
  static const backgroundDarkenPrimary = Color(0xFFD4F1F3);

  // 3. Foreground Colors
  static const foregroundBlack = Color(0xFF52514F);
  static const foregroundBlue = Color(0xFF2F496F);
  static const foregroundPrimary = Color(0xFF3C8D90);
  static const foregroundMutedBlack = Color(0xFFA9A9A9);
  static const foregroundMutedBlue = Color(0xFF6D8DBC);
  static const foregroundMutedPrimary = Color(0xFF5FA8AC);

  // 4. Border Colors
  static const borderBlack = Color(0xFFE2E2E2);
  static const borderBlue = Color(0xFFD1DFEB);
  static const borderPrimary = Color(0xFFCFEFF1);
}
