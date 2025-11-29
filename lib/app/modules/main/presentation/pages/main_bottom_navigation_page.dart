import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gital_flutter/app/modules/common/presentation/widgets/gital_button.dart';
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
                          child: _buildCustomTab(
                            index: 0,
                            currentIndex: currentIndex,
                            label: 'Home',
                            iconAsset: Assets.icons.unselectedHome,
                            onTap: () => tabsRouter.setActiveIndex(0),
                          ),
                        ),
                        Expanded(
                          child: _buildCustomTab(
                            index: 1,
                            currentIndex: currentIndex,
                            label: 'Analysis',
                            iconAsset: Assets.icons.unselectedGraduationHat,
                            onTap: () => tabsRouter.setActiveIndex(1),
                          ),
                        ),
                        Expanded(
                          child: _buildCustomTab(
                            index: 2,
                            currentIndex: currentIndex,
                            label: 'User',
                            iconAsset: Assets.icons.unselectedUser,
                            onTap: () => tabsRouter.setActiveIndex(2),
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
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCustomTab({
    required int index,
    required int currentIndex,
    required String label,
    required dynamic iconAsset,
    required VoidCallback onTap,
  }) {
    final isSelected = index == currentIndex;

    const selectedBgColor = Palette.backgroundDarkenPrimary;
    const selectedIconColor = Palette.foregroundPrimary;
    const unselectedIconColor = Palette.foregroundPrimary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          padding: isSelected
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8)
              : const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? selectedBgColor : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconAsset.svg(
                width: 24.0,
                height: 24.0,
                colorFilter: ColorFilter.mode(
                  isSelected ? selectedIconColor : unselectedIconColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                label,
                style: TextStyle(
                  color: Palette.foregroundMutedPrimary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pretendard',
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
