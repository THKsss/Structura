import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/main/main_screen/view/main_screen.dart';

import 'tap_bar_button.dart';

class SwitchCatrgoriesMenu extends StatelessWidget {
  const SwitchCatrgoriesMenu({
    super.key,
    required this.isNewActive,
    required this.photosCategory,
    required this.switchCategoryCallback,
  });

  final bool isNewActive;
  final PhotosCategory photosCategory;
  final Function() switchCategoryCallback;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // double width = mediaQuery.size.width;
    Orientation orientation = mediaQuery.orientation;
    return orientation == Orientation.portrait
        ? portraitView(context)
        : landscapeView(context);
  }

  Widget portraitView(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Container(
      width: width * 0.95,
      height: width * 0.34444,
      color: whiteClr,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            child: TapBarButton(
              buttonTitle: 'New',
              titleColor: isNewActive ? blackClr : inactiveClr,
              switchCategoryCallback: isNewActive
                  ? () {}
                  : () {
                      switchCategoryCallback();
                    },
            ),
          ),
          Positioned(
            right: 0,
            child: TapBarButton(
              buttonTitle: 'Popular',
              titleColor: isNewActive ? inactiveClr : blackClr,
              switchCategoryCallback: isNewActive
                  ? () {
                      switchCategoryCallback();
                    }
                  : () {},
            ),
          ),
          AnimatedPositioned(
            left: photosCategory == PhotosCategory.newB ? 0 : width * 0.48705,
            bottom: 0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: width * 0.46255,
              height: width * 0.00556,
              color: activeClr,
            ),
          )
        ],
      ),
    );
  }

  Widget landscapeView(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Container(
      width: width * 0.95,
      height: width * 0.07,
      color: whiteClr,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            child: TapBarButton(
              buttonTitle: 'New',
              titleColor: isNewActive ? blackClr : inactiveClr,
              switchCategoryCallback: isNewActive
                  ? () {}
                  : () {
                      switchCategoryCallback();
                    },
            ),
          ),
          Positioned(
            right: 0,
            child: TapBarButton(
              buttonTitle: 'Popular',
              titleColor: isNewActive ? inactiveClr : blackClr,
              switchCategoryCallback: isNewActive
                  ? () {
                      switchCategoryCallback();
                    }
                  : () {},
            ),
          ),
          AnimatedPositioned(
            left: photosCategory == PhotosCategory.newB ? 0 : width * 0.48705,
            bottom: 0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: width * 0.46255,
              height: width * 0.00556,
              color: activeClr,
            ),
          )
        ],
      ),
    );
  }
}
