import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:temp_mail/view/screen.dart';

void main() {
  runApp(TempMailApp());
}

class TempMailApp extends StatelessWidget {
  const TempMailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: screen(),
    );
  }
}
