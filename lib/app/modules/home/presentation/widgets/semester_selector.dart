import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/home/presentation/widgets/semester_design.dart';
import 'package:gital_flutter/app/values/palette.dart';

class SemesterSelector extends StatefulWidget {
  const SemesterSelector({
    super.key,
    this.initialTerm = '2025 가을학기',
    this.termList = const ['2025 가을학기', '2025 봄학기', '2024 가을학기', '2024 봄학기'],
    this.onChanged,
  });

  final String initialTerm;
  final List<String> termList;
  final ValueChanged<String>? onChanged;

  @override
  State<SemesterSelector> createState() => _SemesterSelectorState();
}

class _SemesterSelectorState extends State<SemesterSelector> {
  late String _selectedTerm;
  late List<String> _termList;

  @override
  void initState() {
    super.initState();
    _termList = List<String>.from(widget.termList);
    if (_termList.isEmpty) {
      _termList = widget.initialTerm.isNotEmpty
          ? [widget.initialTerm]
          : ['학기/강의를 선택하세요'];
    }

    _selectedTerm =
        _termList.contains(widget.initialTerm) && widget.initialTerm.isNotEmpty
        ? widget.initialTerm
        : _termList.first;
  }

  @override
  void didUpdateWidget(covariant SemesterSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget.termList, oldWidget.termList)) {
      _termList = List<String>.from(widget.termList);

      if (_termList.isEmpty) {
        _termList = [widget.initialTerm];
      }

      if (!_termList.contains(_selectedTerm)) {
        _selectedTerm = _termList.first;
      }
    }

    if (widget.initialTerm != oldWidget.initialTerm &&
        widget.initialTerm.isNotEmpty &&
        _termList.contains(widget.initialTerm)) {
      _selectedTerm = widget.initialTerm;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 45),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Palette.borderPrimary, width: 1),
      ),

      child: Semester(text: _selectedTerm),

      onSelected: (String value) {
        setState(() {
          _selectedTerm = value;
        });
        widget.onChanged?.call(value);
      },

      itemBuilder: (BuildContext context) {
        return _termList.map((String term) {
          final isSelected = term == _selectedTerm;

          return PopupMenuItem<String>(
            value: term,
            height: 48,
            child: Text(
              term,
              style: TextStyle(
                fontSize: 20,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                fontFamily: 'Pretendard',
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
