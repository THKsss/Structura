import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/main/new_screen/view/new_screen.dart';
import 'package:webant_test/pages/main/popular_screen/view/popular_screen.dart';

import 'view.dart';

enum PhotosCategory { newB, popularB }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PhotosCategory photosCategory = PhotosCategory.newB;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: whiteClr,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            getPhotosListBody(),
            Positioned(
              top: 0,
              child: getPhotosCategory(),
            ),
          ],
        ),
      ),
    );
  }

  getPhotosCategory() {
    switch (photosCategory) {
      case PhotosCategory.newB:
        return SwitchCatrgoriesMenu(
          isNewActive: true,
          photosCategory: photosCategory,
          switchCategoryCallback: () {
            setState(
              () => photosCategory = PhotosCategory.popularB,
            );
          },
        );

      case PhotosCategory.popularB:
        return SwitchCatrgoriesMenu(
          isNewActive: false,
          photosCategory: photosCategory,
          switchCategoryCallback: () {
            setState(
              () => photosCategory = PhotosCategory.newB,
            );
          },
        );
    }
  }

  getPhotosListBody() {
    switch (photosCategory) {
      case PhotosCategory.newB:
        return const NewScreen();
      case PhotosCategory.popularB:
        return const PopularScreen();
    }
  }
}
