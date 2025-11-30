import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/course.dart';
import 'package:gital_flutter/app/modules/home/presentation/widgets/semester_selector.dart';
import 'package:gital_flutter/app/modules/home/presentation/widgets/semester_summary_info.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockData = [
      {
        'code': 'GS-1402',
        'name': '다변수해석학과 응용',
        'prof': '김민기, 유현주',
        'credit': 3,
        'dup': 'MM-1402',
        'gpa': 'A+',
      },
      {'code': 'EC-101', 'name': '컴퓨터 구조', 'prof': '이철수', 'credit': 3},
      {
        'code': 'MM-202',
        'name': '선형대수학',
        'prof': '박영희',
        'credit': 3,
        'dup': 'MATH-202',
      },
      {
        'code': 'GS-303',
        'name': '현대 미술의 이해',
        'prof': '최예술',
        'credit': 2,
        'gpa': 'B+',
      },
      {
        'code': 'GS-404',
        'name': '생물학 개론',
        'prof': '정생물',
        'credit': 3,
        'dup': 'BIO-101',
        'gpa': 'A0',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SemesterSelector(),
              const SizedBox(height: 28),
              const SemesterSummaryInfo(totalCredit: 18, gpa: 4.23),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: mockData.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = mockData[index];

                    // 3가지 케이스를 순서대로 보여주기 위한 로직 (테스트용)
                    // 0 -> home
                    // 1 -> plus (false)
                    // 2 -> plus (true)
                    final int viewCase = index % 3;

                    final String code = item['code'];
                    final String name = item['name'];
                    final String prof = item['prof'];
                    final int credit = item['credit'];
                    final String? dup = item['dup'];
                    final String? gpa = item['gpa'];

                    if (viewCase == 0) {
                      return Course.home(
                        courseCode: code,
                        courseName: name,
                        prof: prof,
                        credit: credit,
                        dup: dup,
                        GPA: gpa,
                      );
                    } else if (viewCase == 1) {
                      return Course.plus(
                        courseCode: code,
                        courseName: name,
                        prof: prof,
                        credit: credit,
                        dup: dup,
                        GPA: gpa,
                        isSelected: false,
                        onTap: () {},
                      );
                    } else {
                      return Course.plus(
                        courseCode: code,
                        courseName: name,
                        prof: prof,
                        credit: credit,
                        dup: dup,
                        GPA: gpa,
                        isSelected: true,
                        onTap: () {},
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
