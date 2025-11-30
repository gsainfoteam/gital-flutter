import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/home/presentation/widgets/semester_selector.dart';
import 'package:gital_flutter/app/values/palette.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SemesterSelector(),
              Expanded(
                child: Center(
                  child: Text(
                    '아직 강의가 없습니다!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Pretendard',
                      color: Palette.foregroundMutedBlack,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
