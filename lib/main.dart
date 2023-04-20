import 'package:appbatech_app/module/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'APPBATECH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFB901),
          primary: const Color(0xFFFFB901),
        ),
      ),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
