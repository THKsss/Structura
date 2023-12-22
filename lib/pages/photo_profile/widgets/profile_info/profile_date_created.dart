import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';

class ProfileDateCreated extends StatelessWidget {
  const ProfileDateCreated({
    super.key,
    required this.dateCreated,
  });

  final String dateCreated;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Orientation orientation = mediaQuery.orientation;
    return orientation == Orientation.portrait
        ? ProfileDateCreatedPortrait(dateCreated: dateCreated)
        : ProfileDateCreatedLandscape(dateCreated: dateCreated);
  }
}

class ProfileDateCreatedPortrait extends StatelessWidget {
  const ProfileDateCreatedPortrait({
    super.key,
    required this.dateCreated,
  });

  final String dateCreated;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.86944,
      height: width * 0.04666,
      child: ASText(
        text: dateCreated,
        color: inactiveClr,
        textAlign: TextAlign.start,
        fontFamily: fontSFPro,
      ),
    );
  }
}

class ProfileDateCreatedLandscape extends StatelessWidget {
  const ProfileDateCreatedLandscape({
    super.key,
    required this.dateCreated,
  });

  final String dateCreated;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.86944,
      height: width * 0.02666,
      child: ASText(
        text: dateCreated,
        color: inactiveClr,
        textAlign: TextAlign.start,
        fontFamily: fontSFPro,
      ),
    );
  }
}
