import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/gital_button.dart';
import 'package:gital_flutter/app/values/palette.dart';

@RoutePage()
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/logos/graduation-hat.svg',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'GITAL',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Pretendard',
                        color: Palette.primary,
                        height: 1.2,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
              ),
              GitalButton.onlyText(text: '시작하기', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
