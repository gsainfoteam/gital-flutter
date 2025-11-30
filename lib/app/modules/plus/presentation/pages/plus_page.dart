import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/course.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/gital_button.dart';
import 'package:gital_flutter/gen/assets.gen.dart';

@RoutePage()
class PlusPage extends StatelessWidget {
  const PlusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 1. 상단 헤더 (고정)
            Container(child: Text("강의 검색")),

            // 2. 리스트뷰 (나머지 공간 꽉 채움 + 스크롤 가능)
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: 10,
                itemBuilder: (context, index) => Course.home(
                  courseCode: "GS-1402",
                  courseName: "다변수해석학과 응용",
                  prof: "김민기, 유현주",
                  credit: 3,
                ),
              ),
            ),

            // 3. 하단 버튼 영역 (바닥에 고정)
            Container(
              height: 60, // 버튼 높이
              child: Row(
                children: [
                  GitalButton.onlyIcon(icon: Assets.icons.unselectedHome.svg()),

                  // 오른쪽 추가하기 버튼 (남은 가로 공간 꽉 채움)
                  Expanded(
                    child: GitalButton.iconAndText(
                      text: '선택한 강의 추가하기',
                      icon: Assets.icons.checkCircle.svg(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
