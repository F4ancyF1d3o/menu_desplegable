import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MessagingDemoApp());
}

class MessagingDemoApp extends StatelessWidget {
  const MessagingDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business, Home & School',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FC),
      ),
      home: const HomePage(),
    );
  }
}
