import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  const Space({
    super.key,
    this.space,
  });

  final double? space;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(height: width * (space ?? 0.05));
  }
}
