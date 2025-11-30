import 'package:flutter/material.dart';
import 'package:gital_flutter/app/values/palette.dart';

enum CourseType { home, plus }

class _CourseTheme {
  final Color background;
  final Color primaryText;
  final Color secondaryText;

  const _CourseTheme({
    required this.background,
    required this.primaryText,
    required this.secondaryText,
  });
}

class Course extends StatelessWidget {
  const Course.home({
    super.key,
    required this.courseCode,
    required this.courseName,
    required this.prof,
    this.dup,
    required this.credit,
    this.GPA,
  }) : type = CourseType.home,
       isSelected = false,
       onTap = null;

  const Course.plus({
    super.key,
    required this.courseCode,
    required this.courseName,
    required this.prof,
    this.dup,
    required this.credit,
    this.GPA,
    required this.isSelected,
    required this.onTap,
  }) : type = CourseType.plus;

  final String courseCode;
  final String courseName;
  final String prof;
  final String? dup;
  final int credit;
  final String? GPA;
  final CourseType type;

  final bool isSelected;
  final VoidCallback? onTap;

  static const List<_CourseTheme> _themes = [
    _CourseTheme(
      background: Palette.backgroundBlack,
      primaryText: Palette.foregroundBlack,
      secondaryText: Palette.foregroundMutedBlack,
    ),
    _CourseTheme(
      background: Palette.backgroundPrimary,
      primaryText: Palette.foregroundPrimary,
      secondaryText: Palette.foregroundMutedPrimary,
    ),
    _CourseTheme(
      background: Palette.backgroundBlue,
      primaryText: Palette.foregroundBlue,
      secondaryText: Palette.foregroundMutedBlue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final int themeIndex = courseCode.hashCode % _themes.length;
    final _CourseTheme currentTheme = _themes[themeIndex.abs()];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: currentTheme.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                courseCode,
                style: TextStyle(
                  color: currentTheme.secondaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Pretendard',
                  height: 1.5,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  courseName,
                  style: TextStyle(
                    color: currentTheme.primaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Pretendard',
                    overflow: TextOverflow.clip,
                    height: 1.5,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              if (type == CourseType.plus) ...[
                const SizedBox(width: 8),

                GestureDetector(
                  onTap: onTap,
                  behavior: HitTestBehavior.opaque,
                  child: Icon(
                    isSelected
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,

                    color: isSelected
                        ? currentTheme.primaryText
                        : currentTheme.secondaryText,
                    size: 28,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          _buildInfoRow('교수', prof, currentTheme),
          const SizedBox(height: 6),
          _buildInfoRow('중복 코드', dup ?? '없음', currentTheme),
          const SizedBox(height: 6),
          _buildInfoRow('학점', '$credit', currentTheme),
          const SizedBox(height: 6),
          _buildInfoRow('평어', GPA ?? '미입력', currentTheme),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, _CourseTheme theme) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: theme.secondaryText,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Pretendard',
            height: 1.5,
            letterSpacing: -0.25,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            color: theme.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Pretendard',
            height: 1.5,
            letterSpacing: -0.25,
          ),
        ),
      ],
    );
  }
}
