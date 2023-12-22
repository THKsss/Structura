import 'package:flutter/material.dart';
import 'package:webant_test/core/core.dart';

class TapBarButton extends StatefulWidget {
  const TapBarButton({
    super.key,
    required this.buttonTitle,
    required this.titleColor,
    required this.switchCategoryCallback,
  });

  final String buttonTitle;
  final Color titleColor;
  final Function() switchCategoryCallback;

  @override
  State<TapBarButton> createState() => _TapBarButtonState();
}

class _TapBarButtonState extends State<TapBarButton> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width * 0.18333,
          height: width * 0.06667,
          child: ASText(
            text: widget.buttonTitle,
            color: widget.titleColor,
            textAlign: TextAlign.center,
            fontFamily: fontSFPro,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: width * 0.45555,
          height: width * 0.12222,
          child: MaterialButton(
            onPressed: () {
              widget.switchCategoryCallback();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
