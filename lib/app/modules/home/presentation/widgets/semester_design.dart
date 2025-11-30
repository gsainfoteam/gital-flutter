import 'package:flutter/material.dart';
import 'package:gital_flutter/app/values/palette.dart';
import 'package:gital_flutter/gen/assets.gen.dart';

class Semester extends StatelessWidget {
  const Semester({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Palette.black,
              height: 1.5,
            ),
          ),
          const SizedBox(width: 4),
          Assets.icons.selectorVertical.svg(
            width: 24.0,
            height: 24.0,
            colorFilter: ColorFilter.mode(
              Palette.foregroundMutedBlack,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
