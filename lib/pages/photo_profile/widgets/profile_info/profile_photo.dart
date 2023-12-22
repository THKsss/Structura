import 'package:flutter/material.dart';
import 'package:webant_test/pages/photo_profile/data/models/photos_profile_data_model.dart';
import 'package:webant_test/pages/photo_profile/view/view.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.state,
  });

  final PhotoProfileDataModel state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Orientation orientation = mediaQuery.orientation;
    return orientation == Orientation.portrait
        ? ProfilePhotoPortrait(state: state)
        : ProfilePhotoLandscape(state: state);
  }
}

class ProfilePhotoPortrait extends StatelessWidget {
  const ProfilePhotoPortrait({
    super.key,
    required this.state,
  });

  final PhotoProfileDataModel state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: width,
      height: width * 0.65555,
      child: ClipRRect(
        child: Image.memory(
          state.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProfilePhotoLandscape extends StatelessWidget {
  const ProfilePhotoLandscape({
    super.key,
    required this.state,
  });

  final PhotoProfileDataModel state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Column(
      children: [
        const Space(space: 0.02),
        SizedBox(
          width: width * 0.15555,
          height: width * 0.15555,
          child: ClipOval(
            child: Image.memory(
              state.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
