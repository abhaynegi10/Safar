import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
         colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF3EBACE),
          secondary: Color(0xFFD8ECF1),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
