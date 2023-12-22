import 'package:flutter/material.dart';
import 'package:webant_test/pages/photo_profile/bloc/photo_profile_bloc.dart';
import 'package:webant_test/pages/photo_profile/widgets/other/spaser.dart';

import 'widgets_profile_info.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.dateCreated,
    required this.state,
  });

  final PhotoProfileLoaded state;
  final String dateCreated;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;
    Orientation orientation = mediaQuery.orientation;
    return SizedBox(
      height: orientation == Orientation.portrait ? height : width,
      child: Column(
        children: [
          ProfilePhoto(state: state.photoProfile),
          Space(
            space: orientation == Orientation.portrait ? 0.05 : 0.02,
          ),
          ProfilePhotoName(state: state.photoProfile),
          const Space(space: 0.02),
          ProfileUsername(state: state.photoProfile),
          const Space(),
          ProfileDescription(state: state.photoProfile),
          const Space(),
          ProfileDateCreated(dateCreated: dateCreated),
          const Space(space: 0.01),
          ProfileViews(state: state.photoProfile),
        ],
      ),
    );
  }
}
