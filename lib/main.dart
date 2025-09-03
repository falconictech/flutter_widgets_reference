import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const FlutterWidgetsReferenceApp());
}

class FlutterWidgetsReferenceApp extends StatelessWidget {
  const FlutterWidgetsReferenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Reference',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
