import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/home/presentation/widgets/semester_selector.dart';
// 👇 새로 만든 위젯 import (경로 확인해주세요)
import 'package:gital_flutter/app/modules/home/presentation/widgets/semester_summary_info.dart';
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
              // 1. 학기 선택
              const SemesterSelector(),
              const SizedBox(height: 28),
              // 2. [수정됨] 정보 요약 위젯으로 깔끔하게 교체!
              const SemesterSummaryInfo(totalCredit: 18, gpa: 4.23),

              // 3. 메인 콘텐츠
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
