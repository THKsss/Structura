import 'package:flutter/material.dart';
import 'pages/main/main_screen/view/main_screen.dart';

class WebAntTestApp extends StatelessWidget {
  const WebAntTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
