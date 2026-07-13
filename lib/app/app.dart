import 'package:flutter/material.dart';
import 'package:volleyaxis/features/splash/presentation/pages/splash_page.dart';

class VolleyAxisApp extends StatelessWidget {
  const VolleyAxisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VolleyAxis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const SplashPage(),
    );
  }
}
