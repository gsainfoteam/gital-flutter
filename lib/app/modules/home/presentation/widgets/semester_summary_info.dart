import 'package:flutter/material.dart';
import 'package:gital_flutter/app/values/palette.dart';

class SemesterSummaryInfo extends StatelessWidget {
  const SemesterSummaryInfo({
    super.key,
    required this.totalCredit,
    required this.gpa,
  });

  final int totalCredit;
  final double gpa;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1. 총 이수 학점
        _buildInfoText(label: '총 이수 학점: ', value: '$totalCredit'),

        // 2. 간격
        const SizedBox(width: 10),

        // 3. GPA
        _buildInfoText(label: 'GPA: ', value: '$gpa'),
      ],
    );
  }

  // 💡 반복되는 스타일을 함수로 추출하여 재사용성 극대화 (DRY 원칙)
  Widget _buildInfoText({required String label, required String value}) {
    return Text.rich(
      TextSpan(
        // 공통 기본 스타일
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Pretendard',
          height: 1.4,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
        children: [
          // 라벨 (회색)
          TextSpan(
            text: label,
            style: TextStyle(color: Palette.foregroundMutedBlack),
          ),
          // 값 (검은색)
          TextSpan(
            text: value,
            style: TextStyle(color: Palette.foregroundBlack),
          ),
        ],
      ),
    );
  }
}
