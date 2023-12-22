import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';

class BlocErrorScreen extends StatefulWidget {
  const BlocErrorScreen({
    super.key,
  });

  @override
  State<BlocErrorScreen> createState() => _BlocErrorScreenState();
}

class _BlocErrorScreenState extends State<BlocErrorScreen> {
  String errorString =
      'Slow or no internet connection.\nPlease check your internet settings';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      height: width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/error_ant.png',
            scale: 0.7,
          ),
          SizedBox(
            height: width * 0.08667,
            child: ASText(
              text: 'Oh shucks!',
              color: titleClr,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: width * 0.08667,
            child: ASText(
              text: errorString,
              color: inactiveClr,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
