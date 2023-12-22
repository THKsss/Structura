import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/photo_profile/data/models/photos_profile_data_model.dart';

class ProfileUsername extends StatelessWidget {
  const ProfileUsername({
    super.key,
    required this.state,
  });

  final PhotoProfileDataModel state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Orientation orientation = mediaQuery.orientation;
    return orientation == Orientation.portrait
        ? ProfileUsernamePortrait(state: state)
        : ProfileUsernameLandscape(state: state);
  }
}

class ProfileUsernamePortrait extends StatelessWidget {
  const ProfileUsernamePortrait({
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
      height: width * 0.06666,
      child: ASText(
        text: state.username,
        color: activeClr,
        textAlign: TextAlign.start,
        fontFamily: fontSFPro,
      ),
    );
  }
}

class ProfileUsernameLandscape extends StatelessWidget {
  const ProfileUsernameLandscape({
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
      height: width * 0.02666,
      child: ASText(
        text: state.username,
        color: activeClr,
        textAlign: TextAlign.center,
        fontFamily: fontSFPro,
      ),
    );
  }
}
