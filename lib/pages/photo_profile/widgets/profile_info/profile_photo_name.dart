import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/photo_profile/data/models/photos_profile_data_model.dart';

class ProfilePhotoName extends StatelessWidget {
  const ProfilePhotoName({
    super.key,
    required this.state,
  });

  final PhotoProfileDataModel state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // double width = mediaQuery.size.width;
    Orientation orientation = mediaQuery.orientation;
    return orientation == Orientation.portrait
        ? ProfilePhotoNamePortrait(state: state)
        : ProfilePhotoNameLandscape(state: state);
  }
}

class ProfilePhotoNamePortrait extends StatelessWidget {
  const ProfilePhotoNamePortrait({
    super.key,
    required this.state,
  });

  final PhotoProfileDataModel state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.86944,
      height: width * 0.09666,
      child: ASText(
        text: state.name,
        color: titleClr,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ProfilePhotoNameLandscape extends StatelessWidget {
  const ProfilePhotoNameLandscape({
    super.key,
    required this.state,
  });

  final PhotoProfileDataModel state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.86944,
      height: width * 0.04666,
      child: ASText(
        text: state.name,
        color: titleClr,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
