import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/photo_profile/data/models/photos_profile_data_model.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({
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
      child: ASText(
        text: state.description,
        maxFontSize: 18,
        color: blackClr,
        textAlign: TextAlign.start,
        fontFamily: fontSFPro,
      ),
    );
  }
}
