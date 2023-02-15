import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasundhara_api/frist_screen.dart';
import 'package:vasundhara_api/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FristScreen(),
    );
  }
}
