import 'package:flutter/material.dart';

import '../features/recognition/recognition_home_page.dart';

class VisualImpairedAssistantApp extends StatelessWidget {
  const VisualImpairedAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    const surfaceColor = Color(0xFF101C22);
    const primaryColor = Color(0xFF13A4EC);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visual Impaired Assistant',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: surfaceColor,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          surface: surfaceColor,
        ),
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const RecognitionHomePage(),
    );
  }
}
