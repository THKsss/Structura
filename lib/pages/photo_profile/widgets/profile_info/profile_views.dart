import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/photo_profile/data/models/photos_profile_data_model.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfileViews extends StatelessWidget {
  const ProfileViews({
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
      child: AutoSizeText.rich(
        TextSpan(
          style: const TextStyle(
            fontSize: 18,
            fontFamily: fontRoboto,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
          children: [
            TextSpan(
              text: 'Views: ',
              style: TextStyle(color: blackClr),
            ),
            TextSpan(
              text: '999+',
              style: TextStyle(color: inactiveClr),
            ),
          ],
        ),
      ),
    );
  }
}
