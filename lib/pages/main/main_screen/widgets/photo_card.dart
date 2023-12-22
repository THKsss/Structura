import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webant_test/pages/photo_profile/view/photo_profile_screen.dart';

class PhotosCard extends StatelessWidget {
  const PhotosCard({
    super.key,
    required this.id,
    required this.image,
  });

  final int id;
  final String image;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    return InkWell(
      onTap: () async {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('photo_id', id.toString());
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MyWidget(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          width * 0.01388,
        ),
        child: Image.memory(
          base64Decode(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
