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
        _buildInfoText(label: '총 이수 학점: ', value: '$totalCredit'),

        const SizedBox(width: 10),

        _buildInfoText(label: 'GPA: ', value: '$gpa'),
      ],
    );
  }

  Widget _buildInfoText({required String label, required String value}) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Pretendard',
          height: 1.4,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
        children: [
          TextSpan(
            text: label,
            style: TextStyle(color: Palette.foregroundMutedBlack),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: Palette.foregroundBlack),
          ),
        ],
      ),
    );
  }
}
