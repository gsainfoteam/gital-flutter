import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/home/presentation/widgets/semester_design.dart';
import 'package:gital_flutter/app/values/palette.dart';

class SemesterSelector extends StatefulWidget {
  const SemesterSelector({super.key});

  @override
  State<SemesterSelector> createState() => _SemesterSelectorState();
}

class _SemesterSelectorState extends State<SemesterSelector> {
  // 1. 상태 관리: 현재 선택된 학기 (초기값)
  String _selectedTerm = '2025 가을학기';

  // 2. 데이터: 선택 가능한 학기 목록
  final List<String> _termList = [
    '2025 가을학기',
    '2025 봄학기',
    '2024 가을학기',
    '2024 봄학기',
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      // 3. 팝업 메뉴 스타일 설정
      offset: const Offset(0, 45), // 버튼 바로 아래에 뜨도록 위치 조정
      elevation: 2, // 그림자 깊이
      color: Colors.white, // 배경색
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // 둥근 모서리
        side: const BorderSide(
          color: Palette.borderPrimary,
          width: 1,
        ), // (선택사항) 테두리
      ),

      // 4. [핵심] 작성하신 UI 위젯 연결
      // _selectedTerm 데이터를 Semester 위젯에 전달하여 화면을 갱신합니다.
      child: Semester(text: _selectedTerm),

      // 5. 항목 선택 시 실행될 로직
      onSelected: (String value) {
        setState(() {
          _selectedTerm = value; // 선택된 학기로 상태 업데이트
        });
      },

      // 6. 드롭다운 리스트 구성
      itemBuilder: (BuildContext context) {
        return _termList.map((String term) {
          // 현재 선택된 항목인지 확인 (스타일 다르게 주기 위해)
          final isSelected = term == _selectedTerm;

          return PopupMenuItem<String>(
            value: term,
            height: 48, // 아이템 높이
            child: Text(
              term,
              style: TextStyle(
                fontSize: 20,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                fontFamily: 'Pretendard',
                // 선택된 항목은 메인 색상, 나머지는 검은색
                color: isSelected
                    ? Palette.black
                    : Palette.foregroundMutedBlack,
                height: 1.5,
                letterSpacing: -0.5,
              ),
            ),
          );
        }).toList();
      },
    );
  }
}
