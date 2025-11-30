import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/course.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/gital_button.dart';
import 'package:gital_flutter/app/modules/plus/presentation/widgets/semester_modal.dart';
import 'package:gital_flutter/app/router.gr.dart';
import 'package:gital_flutter/app/values/palette.dart';
import 'package:gital_flutter/gen/assets.gen.dart';

@RoutePage()
class PlusPage extends StatelessWidget {
  const PlusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '강의 검색',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      fontFamily: 'Pretendard',
                      color: Palette.black,
                      height: 1.5,
                    ),
                  ),
                  Assets.icons.search.svg(width: 24, height: 24),
                ],
              ),

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
              SizedBox(
                height: 60, // 버튼 높이
                child: Row(
                  children: [
                    SizedBox(
                      height: 54,
                      width: 54,
                      child: GitalButton.onlyIcon(
                        icon: Assets.icons.unselectedHome.svg(
                          colorFilter: ColorFilter.mode(
                            Palette.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        onTap: () => context.router.replaceAll([
                          const MainBottomNavigationRoute(
                            children: [HomeRoute()],
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // 오른쪽 추가하기 버튼 (남은 가로 공간 꽉 채움)
                    Expanded(
                      child: GitalButton.iconAndText(
                        text: '선택한 강의 추가하기',
                        icon: Assets.icons.checkCircle.svg(),
                        onTap: () => showSemesterModal(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
