import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/gital_button.dart';
import 'package:gital_flutter/app/modules/main/presentation/widgets/gital_custom_design.dart';
import 'package:gital_flutter/app/router.gr.dart';
import 'package:gital_flutter/app/values/palette.dart';
import 'package:gital_flutter/gen/assets.gen.dart';

@RoutePage()
class MainBottomNavigationPage extends StatelessWidget {
  const MainBottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), AnalysisRoute(), UserRoute()],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),

      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final currentIndex = tabsRouter.activeIndex;

        return Scaffold(
          body: child,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: Palette.white,
                      border: Border.all(
                        color: Palette.borderPrimary,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GitalCustomDesign(
                            label: 'Home',
                            iconAsset: Assets.icons.unselectedHome,
                            onTap: () => tabsRouter.setActiveIndex(0),
                            isSelected: currentIndex == 0,
                          ),
                        ),
                        Expanded(
                          child: GitalCustomDesign(
                            label: 'Analysis',
                            iconAsset: Assets.icons.unselectedGraduationHat,
                            onTap: () => tabsRouter.setActiveIndex(1),
                            isSelected: currentIndex == 1,
                          ),
                        ),
                        Expanded(
                          child: GitalCustomDesign(
                            label: 'User',
                            iconAsset: Assets.icons.unselectedUser,
                            onTap: () => tabsRouter.setActiveIndex(2),
                            isSelected: currentIndex == 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 64,
                  width: 64,
                  child: GitalButton.onlyIcon(
                    icon: Assets.icons.plus.svg(),
                    onTap: () => context.router.push(PlusRoute()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
