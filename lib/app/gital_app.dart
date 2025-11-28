import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gital_flutter/app/di/locator.dart';
import 'package:gital_flutter/app/router.dart';
// final _appRouter = sl<AppRouter>();

class GitalApp extends StatelessWidget {
  const GitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent, // 투명하게 하여 배경이 보이도록
        statusBarIconBrightness: Brightness.dark,
      ),
      child: GestureDetector(
        // 화면 터치 시 키보드 닫기
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: _GitalMaterialApp(),
      ),
    );
  }
}

// -------------------------------------------------------------------------
// Layer 1: MaterialApp & Router
// 실제 UI와 네비게이션을 담당합니다.
// -------------------------------------------------------------------------
class _GitalMaterialApp extends StatelessWidget {
  const _GitalMaterialApp();

  @override
  Widget build(BuildContext context) {
    // 라우터 인스턴스 가져오기 (DI 사용 가정)
    final router = sl<AppRouter>();

    return MaterialApp.router(
      title: 'GITAL',
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),

      // 테마 설정
      theme: ThemeData(
        fontFamily: 'Pretendard',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
