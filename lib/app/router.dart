import 'package:auto_route/auto_route.dart';
import 'package:gital_flutter/app/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: IntroRoute.page),
    AutoRoute(
      path: '/main',
      page: MainBottomNavigationRoute.page,
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'analysis', page: AnalysisRoute.page), // 임시
        AutoRoute(path: 'user', page: UserRoute.page), // 임시
      ],
    ),
    AutoRoute(path: '/plus', page: PlusRoute.page),
  ];
}
