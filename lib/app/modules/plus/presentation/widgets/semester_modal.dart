import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/gital_button.dart';
import 'package:gital_flutter/app/modules/home/presentation/widgets/semester_selector.dart';
import 'package:gital_flutter/app/values/palette.dart';
import 'package:gital_flutter/gen/assets.gen.dart';

// 학기 선택 바텀시트를 띄워 선택된 학기를 문자열로 반환한다.
Future<String?> showSemesterModal(
  BuildContext context, {
  String initialTerm = '2025 가을학기',
  List<String> termList = const [
    '2025 가을학기',
    '2025 봄학기',
    '2024 가을학기',
    '2024 봄학기',
  ],
}) {
  final effectiveTermList = termList.isNotEmpty
      ? termList
      : <String>[initialTerm];

  String selectedTerm =
      effectiveTermList.contains(initialTerm) && initialTerm.isNotEmpty
      ? initialTerm
      : effectiveTermList.first;

  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetContext) {
      final bottomInset = MediaQuery.of(sheetContext).viewInsets.bottom;

      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: 16 + bottomInset,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: Palette.borderBlack,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '해당 강의를 무슨 학기에 추가하시겠습니까?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Palette.foregroundBlack,
                height: 1.5,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 12),
            SemesterSelector(
              initialTerm: selectedTerm,
              termList: effectiveTermList,
              onChanged: (value) => selectedTerm = value,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: GitalButton.iconAndText(
                text: '선택 완료',
                icon: Assets.icons.checkCircle.svg(),
                onTap: () => Navigator.of(sheetContext).pop(selectedTerm),
              ),
            ),
          ],
        ),
      );
    },
  );
}
